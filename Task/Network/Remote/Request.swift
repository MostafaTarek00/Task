//
//  Request.swift
//  FatoorahPOS
//
//  Created by Code In Software on 29/12/2021.
//

import UIKit
import Alamofire

class Service : UIViewController{

   class func request<T: Codable>(url: String, dateFormate: String?, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?,
                                  callBack:@escaping (T,Int) -> Void,
                                  failureHandler:@escaping (Error,Int) -> Void) {
       
       let jsonDecodeer = JSONDecoder()
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = dateFormate
       jsonDecodeer.dateDecodingStrategy = .formatted(dateFormatter)
       
       
       print(url)
       print(parameters)
       URLCache.shared.removeAllCachedResponses()

       //        print(headers)
       AF.request(url, method: method, parameters: parameters, headers: headers).validate().responseJSON { (response) in

            // print(response)
     
           switch response.result {
           case .success:
               if let _ = response.data {
                   guard let resultData = response.data else { fatalError() }
                   do {
                       let basicResponse = try jsonDecodeer.decode(T.self, from: resultData)
                       callBack(basicResponse, response.response?.statusCode ?? 0)
                   }
                   catch(let error) {
                   
                       failureHandler(error, response.response?.statusCode ?? 0)
                   }
               }
           case .failure(let error):
            if response.response?.statusCode == 401 {
              //  UserDefault.setcheckLogin(false)
            }
            failureHandler(error, response.response?.statusCode ?? 0)
           }
       }
       
   }
   
  


}



