//
//  SearchBarcodeViewModel.swift
//  tutumlu
//
//  Created by ali-kerem on 3.01.2024.
//

import Foundation
import Supabase


class SearchBarcodeViewModel {
    private var searchItem: SearchItemModel?
    // private var currentIndex: Int = 0
    
    // Closure for updating the view when data is fetched
    var onUpdate: ((SearchItemModel) -> Void)?
    
    func fetchItemDetails(for barcode: String) async {
        await networkCall(for: barcode)
        /*
        if searchItem == nil {
            // If searchItem is not set, set it to the item at currentIndex (0 initially)
            searchItem = SearchData.items[currentIndex]
        } else {
            // If searchItem is already set, increment the currentIndex
            currentIndex += 1

            // Check if currentIndex is out of bounds and reset if necessary
            if currentIndex >= SearchData.items.count {
                currentIndex = 0
            }

            // Update the searchItem to the new currentIndex
            searchItem = SearchData.items[currentIndex]
        }
        */
        DispatchQueue.main.async { [weak self] in
            if let item = self?.searchItem {
                self?.onUpdate?(item)
            }
        }
    }
    
    private func networkCall(for barcode: String) async {
        let client = SupabaseClient(supabaseURL: URL(string: "https://qbpruczdytiwqouzoztl.supabase.co")!, supabaseKey: "Paste your key here")
        let productData: [ProductData]
        do {
            productData = try await client.database
                .from("prices")
                .select(columns: "price, scans ( markets ( id, name ) ), products ( name )")
                .eq(column: "product_id", value: barcode)
                .execute()
                .value
            
            if searchItem == nil {
                searchItem = SearchItemModel()  // Ensure searchItem is initialized
            }

            searchItem?.name = productData[0].products?.name ?? "Not found"
            searchItem?.priceInfo = [] // Reset or initialize priceInfo

            let extractedData = extractMarketNameAndPrice(from: productData)
            for data in extractedData {
                searchItem?.priceInfo.append(PriceInfo(market: data.marketName ?? "Not found", price: data.price ?? 0.0))
            }
            // print(extractedData)
        } catch {
            print("Error: \(error)")
            return
        }
    }
    
    func extractMarketNameAndPrice(from products: [ProductData]) -> [(marketName: String?, price: Double?)] {
        var result: [(marketName: String?, price: Double?)] = []
        
        for product in products {
            let marketName = product.scans?.markets?.name
            let price = product.price
            
            result.append((marketName, price))
        }
        
        return result
    }
}


struct ProductData: Codable {
    let price: Double?
    let scans: ScanData?
    let products: Product?
    
    enum CodingKeys: String, CodingKey {
        case price
        case scans
        case products
    }
    
    struct ScanData: Codable {
        let markets: Market?
        
        enum CodingKeys: String, CodingKey {
            case markets
        }
    }
    
    struct Market: Codable {
        let id: Int?
        let name: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
        }
    }
    
    struct Product: Codable {
        let name: String?
        
        enum CodingKeys: String, CodingKey {
            case name
        }
    }
}
