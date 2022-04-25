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
    
    
    //  MARK: - Home

    class func getHome(callback: @escaping (Home , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.home
        let headers: HTTPHeaders = [ "lang": MOLHLanguage.currentAppleLanguage()]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: nil, headers:headers, callBack: { (response: Home ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }

   

}

