//
//  SearchItemModel.swift
//  tutumlu
//
//  Created by ali-kerem on 30.12.2023.
//

struct SearchItemModel {
    var name: String?
    var priceInfo: [PriceInfo] = []
}

struct PriceInfo {
    let market: String
    let price: Double?
}
    
    
struct SearchNameResponseModel: Codable {
    let name: String
    let prices: [PriceData]
    
    enum CodingKeys: String, CodingKey {
        case name
        case prices
    }
    
    struct PriceData: Codable {
        let price: Double
        let scans: ScanData?
        
        enum CodingKeys: String, CodingKey {
            case price
            case scans
        }
        
        struct ScanData: Codable {
            let markets: Market?
            
            enum CodingKeys: String, CodingKey {
                case markets
            }
            
            struct Market: Codable {
                let name: String?
                
                enum CodingKeys: String, CodingKey {
                    case name
                }
            }
        }
    }
}


struct SearchBarcodeResponseModel: Codable {
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
