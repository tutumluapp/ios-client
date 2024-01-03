//
//  SearchItemModel.swift
//  tutumlu
//
//  Created by ali-kerem on 30.12.2023.
//

struct SearchItemModel {
    var name: String
    let priceInfo: [PriceInfo]
}

struct PriceInfo {
    let market: String
    let price: Double
}
