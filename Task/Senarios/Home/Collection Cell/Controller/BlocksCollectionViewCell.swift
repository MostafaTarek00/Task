//
//  BlocksCollectionViewCell.swift
//  Task
//
//  Created by Code In Software on 21/04/2022.
//

import UIKit

class BlocksCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productCategoryNameLbl: UILabel!
    @IBOutlet weak var productCategoryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCollectionCell(  data: [Block] , index : Int)  {
        if let image = data[index].blockImage {
            productCategoryImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "delivery-box"))
        }
        
        if let name = data[index].title {
            productCategoryNameLbl.text = name
        }else{
            productCategoryNameLbl.text = ""
            
        }
    }

}
