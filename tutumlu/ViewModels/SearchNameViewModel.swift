//
//  SearchNameViewModel.swift
//  tutumlu
//
//  Created by ali-kerem on 4.01.2024.
//

import Foundation

class SearchNameViewModel {
    private var searchItems: [SearchItemModel]?
    
    // Closure for updating the view when data is fetched
    var onUpdate: (([SearchItemModel]) -> Void)?
    
    func fetchItems(for subString: String) async {
        do {
            let products = try await networkCall(for: subString)
            // print(subString)
            // print(products)
            if let itemModels = convertToSearchItemModels(products) {
                DispatchQueue.main.async { [weak self] in
                    self?.searchItems = itemModels
                    self?.onUpdate?(itemModels)
                }
            }

        } catch {
            print("Error fetching items matching string: \(error)")
        }
    }
    
    private func networkCall(for subString: String) async throws -> [SearchNameResponseModel] {
        let dbManager = DatabaseManager()
        return try await dbManager.searchProductsMatchingString(for: subString)
    }
    
    func convertToSearchItemModels(_ responseModels: [SearchNameResponseModel]) -> [SearchItemModel]? {
        return responseModels.compactMap { responseModel in
            guard !responseModel.prices.isEmpty else {
                return nil
            }

            var searchItem = SearchItemModel(name: responseModel.name, priceInfo: [])

            responseModel.prices.forEach { priceData in
                if let marketName = priceData.scans?.markets?.name {
                    let priceInfo = PriceInfo(market: marketName, price: priceData.price)
                    searchItem.priceInfo.append(priceInfo)
                }
            }

            return searchItem
        }
    }
}
