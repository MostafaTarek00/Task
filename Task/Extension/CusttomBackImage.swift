//
//  CusttomBackImage.swift
//  Dishme
//
//  Created by Code In Software on 17/02/2022.
//

import UIKit
import MOLH
class CusttomBackImage: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUiview()
    }
    
    
    func setUpUiview()  {
       
        updateDesignLang()
    }

   
    func updateDesignLang()  {
        if MOLHLanguage.currentAppleLanguage() == "en"{
            self.image = UIImage(named: "BackEn")
        }
        else if  MOLHLanguage.currentAppleLanguage() == "ar"{
            self.image = UIImage(named: "BackAr")

        }
    }
}


import UIKit
import MOLH
class CusttomArrowImage: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUiview()
    }
    
    
    func setUpUiview()  {
       
        updateDesignLang()
    }

   
    func updateDesignLang()  {
        if MOLHLanguage.currentAppleLanguage() == "en"{
            self.image = UIImage(named: "BackAr")
        }
        else if  MOLHLanguage.currentAppleLanguage() == "ar"{
            self.image = UIImage(named: "BackEn")

        }
    }
}


import UIKit
import MOLH
class CusttomArrowWhiteImage: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUiview()
    }
    
    
    func setUpUiview()  {
       
        updateDesignLang()
    }

   
    func updateDesignLang()  {
        if MOLHLanguage.currentAppleLanguage() == "en"{
            self.image = UIImage(named: "BackWhiteEn")
        }
        else if  MOLHLanguage.currentAppleLanguage() == "ar"{
            self.image = UIImage(named: "BackWhiteAr")

        }
    }
}
