//
//  Home.swift
//  yajhz
//
//  Created by Code In Software on 20/04/2022.
//

import Foundation

// MARK: - Home
struct Home: Codable {
    let status: Status?
    let data: HomeData?
}

// MARK: - HomeData
struct HomeData: Codable {
    let popupAd: PopupAd?
    let meta: Meta?
    let banners: [Banner]?
}

// MARK: - Banner
struct Banner: Codable {
    let type: String?
    let content: Content?
}

// MARK: - Content
struct Content: Codable {
    let backgroundImage: String?
    let backgroundFocusPoint: String?
    let backgroundColor: String?
    let heading: String?
    let blocks: [Block]?
    let type: String?
    let id: Int?
    let products: [Product]?
    let textColor: String?
    let brands: [Brand]?
}


// MARK: - Block
struct Block: Codable {
    let type: String?
    let id: Int
    let title: String?
    let blockImage: String?
    let blockBackgroundColor, textColor: String?
    let image: String?
}

// MARK: - Brand
struct Brand: Codable {
    let id: Int?
    let image: String?
    let category: Int?
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let brand: String?
    let rating: Double?
    let variants: [Variant]?
}

// MARK: - Variant
struct Variant: Codable {
    let id: Int?
    let isDefault, hasStock: Bool?
    let stock: Int?
    let unlimitedStock: Bool?
    let minQty, maxQty, weight: Int?
    let dateAdded: String?
    let onSale: Bool?
    let currency: String?
    let price, salePrice, saleAmount: Double?
    let saleType: String?
    let bestSeller: Bool?
    let badge: String?
    let badgeTextColor: String?
    let badgeBackground: String?
}






// MARK: - Meta
struct Meta: Codable {
    let pageNumber, pageLimit, totalPages: Int?
}

// MARK: - PopupAd
struct PopupAd: Codable {
}

// MARK: - Status
struct Status: Codable {
    let success: Bool?
    let code: Int?
    let message, devMsg: String?
    let update: Update?
}

// MARK: - Update
struct Update: Codable {
    let forceUpdate: Bool?
    let forceUpdateMessage: String?
}


// main
// categoryProductsSlider
// productsCover
// categoryCover
// brandsSlider
