//
//  Home+Api.swift
//  Task
//
//  Created by Code In Software on 21/04/2022.
//

import UIKit
import Foundation
import NVActivityIndicatorView
//import MOLH

extension HomeViewController : NVActivityIndicatorViewable   {
    
    
    //    MARK: - Func to Get Home Api
    
    func getHomeData(){
        self.startAnimating()
        Services.getHome(callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status?.success == true{
                    self.home = result
                self.homeTableView.reloadData()
            }else{
                Alert.show("Error".localized, massege: result.status?.message ?? "", context: self)
            }
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
    }

}
