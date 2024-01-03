//
//  TemplateData.swift
//  tutumlu
//
//  Created by ali-kerem on 30.12.2023.
//

struct SearchData {
    static let items: [SearchItemModel] = [
        SearchItemModel(name: "Item1's Name", priceInfo: [
            PriceInfo(market: "Market A", price: 2.5),
            PriceInfo(market: "Market B", price: 3.0),
            PriceInfo(market: "Market C", price: 2.8)
        ]),
        SearchItemModel(name: "Item2's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItemModel(name: "Item3's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItemModel(name: "Item4's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItemModel(name: "Item5's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItemModel(name: "Item6's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItemModel(name: "Item7's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItemModel(name: "Item8's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItemModel(name: "Item9's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItemModel(name: "Item10's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItemModel(name: "Item11's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ])
    ]
}


struct UploadData {
    static let items: [UploadItem] = [
        UploadItem(name: "Item1", price: 12.95, barcodeID: "1234567890123"),
        UploadItem(name: "Item2", price: 2.95, barcodeID: "2345678901234"),
        UploadItem(name: "Item3", price: 1.95, barcodeID: "3456789012345"),
        UploadItem(name: "Item4", price: 12.55, barcodeID: "4567890123456"),
        UploadItem(name: "Item5", price: 7.65, barcodeID: "5678901234567"),
        UploadItem(name: "Item6", price: 8.99, barcodeID: "6789012345678"),
        UploadItem(name: "Item7", price: 5.49, barcodeID: "7890123456789"),
        UploadItem(name: "Item8", price: 1.99, barcodeID: "8901234567890"),
        UploadItem(name: "Item9", price: 8.88, barcodeID: "9012345678901"),
        UploadItem(name: "Item10", price: 4.20, barcodeID: "0123456789012"),
        UploadItem(name: "Item11", price: 1.11, barcodeID: "1234567890123"),
    ]
    
}
