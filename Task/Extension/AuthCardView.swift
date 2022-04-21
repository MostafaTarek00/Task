//
//  AuthCardView.swift
//  Floweration
//
//  Created by Moustafa on 30/08/2021.
//

import UIKit

class AuthCardView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUiview()
    }
    
    
    func setUpUiview()  {
        self.layer.cornerRadius = 12
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize()
        self.layer.shadowOpacity = 0.5
       
    }

   
   
}


