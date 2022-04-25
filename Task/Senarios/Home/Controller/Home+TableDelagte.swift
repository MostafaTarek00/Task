//
//  Home+TableDelagte.swift
//  Task
//
//  Created by Code In Software on 21/04/2022.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource   {
    
    func setUpTableView(){
        homeTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
        homeTableView.register(UINib(nibName: "CategoryProductsSliderTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryProductsSliderTableViewCell")
        homeTableView.register(UINib(nibName: "ProductsCoverTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductsCoverTableViewCell")

        homeTableView.delegate = self
        homeTableView.dataSource = self


    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return home?.data?.banners?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIndex = indexPath.row

        switch home?.data?.banners?[cellIndex].type {
        case "main":
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
            if let banners = home?.data?.banners {
                cell.configTableCell(data: banners, index: cellIndex, type: "main")
            }
            return cell
        case "categoryProductsSlider":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryProductsSliderTableViewCell", for: indexPath) as! CategoryProductsSliderTableViewCell
            if let banners = home?.data?.banners {
            cell.configTableCell(data: banners, index: cellIndex)
            }
            return cell
        case "productsCover":
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCoverTableViewCell", for: indexPath) as! ProductsCoverTableViewCell
            if let banners = home?.data?.banners {
            cell.configTableCell(data: banners, index: cellIndex)
            }
            return cell
        case "categoryCover":
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
            if let banners = home?.data?.banners {
                cell.configTableCell(data: banners, index: cellIndex, type: "categoryCover")
            }
            return cell
        default:
           return UITableViewCell()
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        
    }

}
