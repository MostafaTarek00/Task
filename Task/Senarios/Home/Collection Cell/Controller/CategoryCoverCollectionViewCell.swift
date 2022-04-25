//
//  CategoryCoverCollectionViewCell.swift
//  Task
//
//  Created by Code In Software on 25/04/2022.
//

import UIKit

class CategoryCoverCollectionViewCell: UICollectionViewCell {

   
    
    @IBOutlet weak var productCategoryView: UIView!{
        didSet{
            productCategoryView.layer.cornerRadius = productCategoryView.bounds.height / 2
        }
    }
    @IBOutlet weak var productCategoryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCollectionCell(  data: [Block] , index : Int)  {
        if let image = data[index].image {
            productCategoryImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "delivery-box"))
        }
        
      
    }

}
