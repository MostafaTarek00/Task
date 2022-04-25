//
//  BrandsTableViewCell.swift
//  Task
//
//  Created by Code In Software on 25/04/2022.
//

import UIKit

class BrandsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categorNameLbl: UILabel!
    @IBOutlet weak var brandsCollectionView: UICollectionView!
    var brands: [Brand]?{
        didSet{
            brandsCollectionView.reloadData()
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
    func configTableCell(  data: [Banner] , index : Int )  {
        if let name = data[index].content?.heading {
            categorNameLbl.text = name
        }else{
            categorNameLbl.text = ""
            
        }
        if let brands = data[index].content?.brands {
            self.brands = brands
        }
        
        
    }
    
}


import UIKit
//MARK: - Extension

//MARK:-UICollectionViewDelegate And UICollectionViewDataSource

extension BrandsTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func setUpCollectionView(){
        brandsCollectionView.delegate = self
        brandsCollectionView.dataSource = self
        brandsCollectionView.register(UINib(nibName: "BrandsSliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BrandsSliderCollectionViewCell")
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return brands?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandsSliderCollectionViewCell", for: indexPath) as! BrandsSliderCollectionViewCell
        let cellIndex = indexPath.item
        if let data = brands {
            cell.configCollectionCell(data: data, index: cellIndex)
        }
        return cell
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    
    
}





//MARK:-UICollectionViewDelegateFlowLayout

extension BrandsTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let cellSize = CGSize(width: 140 , height: 140 )
        return cellSize
        
        
    }
}

