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
            print("Error executing query for gettin price data for barcode: \(error)")
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
            print(products)
            return products
        } catch {
            print("Error executing query for gettin price data for barcode: \(error)")
            throw error  // Propagate the error to the caller
        }
    }
}
