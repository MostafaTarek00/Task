//
//  MainTableViewCell.swift
//  Task
//
//  Created by Code In Software on 21/04/2022.
//

import UIKit
import SDWebImage
class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var blocksCollectionView: UICollectionView!
    var blocks: [Block]?{
        didSet{
            blocksCollectionView.reloadData()
        }
    }
    var type : String?
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configTableCell(  data: [Banner] , index : Int , type : String)  {
        if let image = data[index].content?.backgroundImage {
            mainImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "delivery-box"))
        }
        if let blocks = data[index].content?.blocks {
            self.blocks = blocks
        }
        self.type = type
    }
    
}



import UIKit
//MARK: - Extension

//MARK:-UICollectionViewDelegate And UICollectionViewDataSource

extension MainTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func setUpCollectionView(){
        blocksCollectionView.delegate = self
        blocksCollectionView.dataSource = self
        blocksCollectionView.register(UINib(nibName: "BlocksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BlocksCollectionViewCell")
        blocksCollectionView.register(UINib(nibName: "CategoryCoverCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCoverCollectionViewCell")

        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      
        return blocks?.count ?? 0
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let type = type {
            if type == "main" {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlocksCollectionViewCell", for: indexPath) as! BlocksCollectionViewCell
                let cellIndex = indexPath.item
                if let data = blocks {
                    cell.configCollectionCell(data: data, index: cellIndex)
                }
                return cell
            }else if type == "categoryCover"{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCoverCollectionViewCell", for: indexPath) as! CategoryCoverCollectionViewCell
                let cellIndex = indexPath.item
                if let data = blocks {
                    cell.configCollectionCell(data: data, index: cellIndex)
                }
                return cell
            }
                    
        }
        return UICollectionViewCell()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }

    
    
}





//MARK:-UICollectionViewDelegateFlowLayout

extension MainTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
            let cellSize = CGSize(width: 140 , height: 140 )
            return cellSize
       
    }
}

