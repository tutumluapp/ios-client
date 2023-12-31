//
//  TemplateData.swift
//  tutumlu
//
//  Created by ali-kerem on 30.12.2023.
//

struct SearchData {
    static let items: [SearchItem] = [
        SearchItem(name: "Item1's Name", priceInfo: [
            PriceInfo(market: "Market A", price: 2.5),
            PriceInfo(market: "Market B", price: 3.0),
            PriceInfo(market: "Market C", price: 2.8)
        ]),
        SearchItem(name: "Item2's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItem(name: "Item3's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItem(name: "Item4's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItem(name: "Item5's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItem(name: "Item6's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItem(name: "Item7's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItem(name: "Item8's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItem(name: "Item9's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItem(name: "Item10's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ]),
        SearchItem(name: "Item11's Name", priceInfo: [
            PriceInfo(market: "Market A101", price: 2.5),
            PriceInfo(market: "Market A102", price: 2.7),
            PriceInfo(market: "Market A103", price: 2.9)
        ])
    ]
}


struct UploadData {
    static let items: [UploadItem] = [
        UploadItem(name: "Item1", price: 12.95, barcodeID: "1213131"),
        UploadItem(name: "Item2", price: 2.95, barcodeID: "1213131"),
        UploadItem(name: "Item3", price: 1.95, barcodeID: "1213131"),
        UploadItem(name: "Item4", price: 12.55, barcodeID: "1213131"),
        UploadItem(name: "Item5", price: 7.65, barcodeID: "1213131"),
        UploadItem(name: "Item6", price: 8.99, barcodeID: "1213131"),
        UploadItem(name: "Item7", price: 5.49, barcodeID: "1213131"),
        UploadItem(name: "Item8", price: 1.99, barcodeID: "1213131"),
        UploadItem(name: "Item9", price: 8.88, barcodeID: "1213131"),
        UploadItem(name: "Item10", price: 4.20, barcodeID: "1213131"),
        UploadItem(name: "Item11", price: 1.11, barcodeID: "1213131"),
    ]
    
}
