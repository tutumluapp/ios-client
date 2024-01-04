//
//  SearchBarcodeViewModel.swift
//  tutumlu
//
//  Created by ali-kerem on 3.01.2024.
//

import Foundation

class SearchBarcodeViewModel {
    private var searchItem: SearchItemModel?
    
    // Closure for updating the view when data is fetched
    var onUpdate: ((SearchItemModel) -> Void)?
    
    func fetchItemDetails(for barcode: String) async {
        do {
            let products = try await networkCall(for: barcode)
            print(products)
            if let itemModel = extractMarketNameAndPrice(from: products) {
                DispatchQueue.main.async { [weak self] in
                    self?.searchItem = itemModel
                    self?.onUpdate?(itemModel)
                }
            }
        } catch {
            print("Error fetching item details: \(error)")
        }
    }
    
    private func networkCall(for barcode: String) async throws -> [SearchBarcodeResponseModel] {
        let dbManager = DatabaseManager()
        return try await dbManager.searchPricesAndMarketsForBarcode(for: barcode)
    }
    
    func extractMarketNameAndPrice(from products: [SearchBarcodeResponseModel]) -> SearchItemModel? {
        guard let firstProduct = products.first, let productName = firstProduct.products?.name else {
            return nil
        }

        var itemModel = SearchItemModel(name: productName, priceInfo: [])
        for product in products {
            if let marketName = product.scans?.markets?.name, let price = product.price {
                itemModel.priceInfo.append(PriceInfo(market: marketName, price: price))
            }
        }

        return itemModel
    }
}
