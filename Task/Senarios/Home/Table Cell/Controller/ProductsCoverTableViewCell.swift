//
//  ProductsCoverTableViewCell.swift
//  Task
//
//  Created by Code In Software on 25/04/2022.
//

import UIKit

class ProductsCoverTableViewCell: UITableViewCell {

    @IBOutlet weak var productsTextLbl: UILabel!
    @IBOutlet weak var productsCoverImage: UIImageView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    var products: [Product]?{
        didSet{
            productCollectionView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configTableCell(  data: [Banner] , index : Int)  {
        if let image = data[index].content?.backgroundImage {
            productsCoverImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "delivery-box"))
        }
        if let heading = data[index].content?.heading {
            productsTextLbl.text = heading
        }else{
            productsTextLbl.text = ""

        }
        if let textColor = data[index].content?.textColor {
            productsTextLbl.textColor = UIColor(hexString: textColor)
        }else{
            productsTextLbl.textColor = UIColor.black
        }
        if let products = data[index].content?.products {
            self.products = products
        }
    }
}


import UIKit
//MARK: - Extension

//MARK:-UICollectionViewDelegate And UICollectionViewDataSource

extension ProductsCoverTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func setUpCollectionView(){
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
   
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      
        return products?.count ?? 0
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
            let cellIndex = indexPath.item
            if let data = products {
                cell.configCollectionCell(data: data, index: cellIndex)
            }
            return cell
     
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }

    
    
}





//MARK:-UICollectionViewDelegateFlowLayout

extension ProductsCoverTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
            let cellSize = CGSize(width: 140 , height: 310 )
            return cellSize
       
    }
}

