//
//  SlipDataModel.swift
//  tutumlu
//
//  Created by ali-kerem on 1.01.2024.
//

import Foundation

struct SlipDataModel {
    var marketName: String?
    var date: String?
    var time: String?
    var itemData: [UploadItem] = []
}


struct ScanRequestModel: Encodable {
    let id: Int
    let created_at: String?
    let market_id: Int
    let user_id: UUID?
}


struct PriceRequestModel: Encodable {
    let id: Int
    let price: Double
    let scan_id: Int
    let product_id: Int
}

