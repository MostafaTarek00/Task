//
//  CategoryProductsSliderTableViewCell.swift
//  Task
//
//  Created by Code In Software on 21/04/2022.
//

import UIKit

class CategoryProductsSliderTableViewCell: UITableViewCell {

    @IBOutlet weak var categorNameLbl: UILabel!
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
        if let name = data[index].content?.heading {
            categorNameLbl.text = name
        }else{
            categorNameLbl.text = ""
            
        }
        if let products = data[index].content?.products {
            self.products = products
        }
    }
    
}



import UIKit
//MARK: - Extension

//MARK:-UICollectionViewDelegate And UICollectionViewDataSource

extension CategoryProductsSliderTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource {
    
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

extension CategoryProductsSliderTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
            let cellSize = CGSize(width: 140 , height: 310 )
            return cellSize
       
    }
}

