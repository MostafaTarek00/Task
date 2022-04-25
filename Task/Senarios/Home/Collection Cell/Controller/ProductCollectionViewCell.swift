//
//  ProductCollectionViewCell.swift
//  Task
//
//  Created by Code In Software on 21/04/2022.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var badgeTextLbl: UILabel!
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var producrDisLbl: UILabel!
    @IBOutlet weak var priceAfterOfferLbl: UILabel!
    @IBOutlet weak var discountPriceLbl: UILabel!
    @IBOutlet weak var priceBeforeOfferLbl: UILabel!
    @IBOutlet weak var priceBeforeOfferStack: UIStackView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configCollectionCell(  data: [Product] , index : Int)  {
        if let image = data[index].image {
            productImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "delivery-box"))
        }
        
        if let name = data[index].brand {
            productNameLbl.text = name
        }else{
            productNameLbl.text = ""
        }
        
        if let title = data[index].title {
            producrDisLbl.text = title
        }else{
            producrDisLbl.text = ""
        }
        
        if let onSale = data[index].variants?[0].onSale  {
            switch onSale {
            case true:
                clacPriceBeforOffer(data: data, index: index)
                clacPriceAfterOffer(data: data, index: index)
            case false:
                priceBeforeOfferLbl.text = ""
                discountPriceLbl.text = ""
                clacPriceAfterOffer(data: data, index: index)
            }
        }
        
        if let badge = data[index].variants?[0].badge , badge != "" {
            badgeView.isHidden = false
            badgeTextLbl.text = badge
            if let badgeTextColor = data[index].variants?[0].badgeTextColor {
                badgeTextLbl.textColor = UIColor(hexString: badgeTextColor)
                if let badgeBackground = data[index].variants?[0].badgeBackground {
                    badgeView.backgroundColor = UIColor(hexString: badgeBackground)
                }
                
            }
        }else{
            badgeView.isHidden = true
        }
        
        
        
    }
    
    func clacPriceAfterOffer(data: [Product]  , index : Int)  {
        if let salePrice = data[index].variants?[0].salePrice , let currency = data[index].variants?[0].currency {
            priceAfterOfferLbl.text = "\(salePrice) \(currency)"
        }else{
            priceAfterOfferLbl.text = ""
        }
    }
    
    func clacPriceBeforOffer(data: [Product]  , index : Int)   {
        if let price = data[index].variants?[0].price , let saleAmount = data[index].variants?[0].saleAmount  , let currency = data[index].variants?[0].currency {
            priceBeforeOfferLbl.attributedText = "\(price) \(currency)".strikeThrough()
            if let saleType = data[index].variants?[0].saleType {
                if saleType == "percent" {
                    discountPriceLbl.text = "\(saleAmount) % خصم"
                }
            }
        }else{
            priceBeforeOfferLbl.text = ""
            discountPriceLbl.text = ""
            
        }
    }
    
}
