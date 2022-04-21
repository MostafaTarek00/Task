//
//  IconeTint.swift
//  Floweration
//
//  Created by Moustafa on 26/08/2021.
//

import UIKit
@IBDesignable

class IconeTint: UIImageView {

    @IBInspectable var tc: UIColor? {
        didSet {
            updateViewLeft()
        }
    }
    
    
    func updateViewLeft() {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = tc
    }
    
    
}
