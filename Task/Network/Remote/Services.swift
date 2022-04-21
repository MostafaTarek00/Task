//
//  Services.swift
//  FatoorahPOS
//
//  Created by Code In Software on 29/12/2021.
//

import UIKit
import Alamofire
import MOLH

class Services {
    
}
extension Services {
    
    
    //  MARK: - Login

    class func getLogin(email : String ,password : String  ,  callback: @escaping (Register , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.login
        let headers: HTTPHeaders = [ "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["name": email , "password" : password  ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: Register ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }

    //  MARK: - Shfit Report

    class func getShfitReport(  callback: @escaping (ShfitReport , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.shfitReport
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:headers, callBack: { (response: ShfitReport ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - End Shfit

    class func getEndShfit( endShift : Int ,   callback: @escaping (Register , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.endShfit
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["endShift": endShift ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: Register ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Categories

    class func getCategories( level : Int , catId : Int ,  callback: @escaping (Categories , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.Categories
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["level": level , "cat_id" : catId  ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: parameters, headers:headers, callBack: { (response: Categories ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Product

    class func getProduct( parCode : String , searchText : String , catId : Int , pro : String , callback: @escaping (Products , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.product
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["parCode": parCode , "searchText" : searchText  , "cat_id" : catId  , "products" : pro] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: parameters, headers:headers, callBack: { (response: Products ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Settings

    class func getSettings( callback: @escaping (Setting , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.settings
        let headers: HTTPHeaders = ["Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:headers, callBack: { (response: Setting ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    
    
    //  MARK: - All Customer

    class func getCustomers( searchText :  String ,  callback: @escaping (Customers , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.customers
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["searchText": searchText  ] as [String : Any]

        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: parameters, headers:headers, callBack: { (response: Customers ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    
    
    //  MARK: - Add Customer

    class func addCustomer( name: String ,  email : String , phone : String ,  address : String ,  callback: @escaping (AddClient , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.addClient
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["name": name , "email" : email  , "phone" : phone , "address" : address ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: AddClient ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - update Customer

    class func editCustomer( name: String ,  email : String , phone : String , id : Int ,  callback: @escaping (AddClient , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.editClient
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["name": name , "email" : email  , "phone" : phone , "id" : id ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: AddClient ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    
    //  MARK: - Create Bil

    class func getCreateBil( userId: Int ,  note : String , dueDate : String , products : String , type : Int ,addPrices : String ,paymentType : Int , name : String , phone : String ,  address : String , parentInvoice : Int ,  callback: @escaping (Invoice , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.createBil
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["user_id": userId , "note" : note  , "dueDate" : dueDate , "products" : products , "type" : type , "addPrices" : addPrices , "paymentType" : paymentType , "name" : name , "phone" : phone , "address" : address , "parentInvoice" : parentInvoice] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: Invoice ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    
    //  MARK: - Reservations

    class func getReservations(  todayReservations : String  , type : Int  ,searchText : String , toDueDate : String , fromDueDate : String , userId : Int ,  callback: @escaping (Reservations , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.reservations
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["today_reservations" : todayReservations   , "type" : type  , "searchText" : searchText , "toDueDate" : toDueDate , "fromDueDate" : fromDueDate , "user_id" : userId ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: parameters, headers:headers, callBack: { (response: Reservations ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Single Bil

    class func getSingleBil( invoiceNumber : Int ,  callback: @escaping (Invoice , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.singleBil
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["invoiceNumber": invoiceNumber] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: parameters, headers:headers, callBack: { (response: Invoice ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }

}

