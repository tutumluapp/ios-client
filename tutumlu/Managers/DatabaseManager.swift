//
//  DatabaseManager.swift
//  tutumlu
//
//  Created by ali-kerem on 4.01.2024.
//

import Foundation
import Supabase


class DatabaseManager {
    let client = SupabaseClient(supabaseURL: URL(string: "https://qbpruczdytiwqouzoztl.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFicHJ1Y3pkeXRpd3FvdXpvenRsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTcxMzE0ODUsImV4cCI6MjAxMjcwNzQ4NX0.aWqvr3-qOnJGQXZwk4GVNVXRnd2OKMOn3fkWF8Pm2UE")
    
    func searchPricesAndMarketsForBarcode(for barcode: String) async throws -> [SearchBarcodeResponseModel] {
        let productData: [SearchBarcodeResponseModel]
        do {
            productData = try await client.database
                .from("prices")
                .select(columns: "price, scans ( markets ( id, name ) ), products ( name )")
                .eq(column: "product_id", value: barcode)
                .execute()
                .value
            return productData
        } catch {
            print("Error executing query for getting price data for barcode: \(error)")
            throw error  // Propagate the error to the caller
        }
    }
    
    func searchProductsMatchingString(for substring: String) async throws -> [SearchNameResponseModel] {
        let products: [SearchNameResponseModel]
        do {
            products = try await client.database
                .from("products")
                .select(columns: "name, prices ( price, scans ( markets ( name ) ) )")
                .ilike(column: "name", value: "%\(substring)%")
                .execute()
                .value
            // print(products)
            return products
        } catch {
            print("Error executing query for getting price data for name: \(error)")
            throw error  // Propagate the error to the caller
        }
    }
    
    func createScan(for scan: SlipDataModel) async throws {
        let mapping: [String: Int] = ["A101": 1, "ŞOK": 2, "MİGROS": 3]
        
        do {
            let countScans = try await client.database
              .from("scans")
              .select(columns: "*", head: true, count: .exact)
              .execute()
              .count
            
            let countPrices = try await client.database
              .from("prices")
              .select(columns: "*", head: true, count: .exact)
              .execute()
              .count
            
            let scanId = countScans! + 1
            var priceId = countPrices! + 1

            
            let scanRequest = ScanRequestModel(id: scanId, created_at: nil, market_id: mapping[scan.marketName ?? "A101"] ?? 1, user_id: nil)
            
            try await client.database
              .from("scans")
              .insert(values: scanRequest)
              .execute()
            
            
            var pricesRequest: [PriceRequestModel] = []
            
            for priceModel in scan.itemData {
                pricesRequest.append(PriceRequestModel(
                    id: priceId,
                    price: priceModel.price ?? 0,
                    scan_id: scanId,
                    product_id: Int(priceModel.barcodeID ?? "0") ?? 0 // Provide a default value in case of failure
                ))
                priceId = priceId + 1
            }
            
            // print(pricesRequest)
            
            try await client.database
              .from("prices")
              .insert(values: pricesRequest)
              .execute()
            
            
        } catch {
            print("Error executing query sending scan info: \(error)")
            throw error  // Propagate the error to the caller
        }
    }
}
