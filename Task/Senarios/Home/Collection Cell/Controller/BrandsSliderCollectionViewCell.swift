//
//  BrandsSliderCollectionViewCell.swift
//  Task
//
//  Created by Code In Software on 25/04/2022.
//

import UIKit

class BrandsSliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var brandImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCollectionCell(  data: [Brand] , index : Int)  {
        if let image = data[index].image {
            brandImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "delivery-box"))
        }
    }
}
