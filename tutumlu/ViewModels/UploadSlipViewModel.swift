//
//  UploadSlipViewModel.swift
//  tutumlu
//
//  Created by ali-kerem on 3.01.2024.
//

class UploadSlipViewModel {
    private var slipData: SlipDataModel
    // Additional properties for user input and other data
    
    var onItemsUpdated: (() -> Void)?
    
    init(slipData: SlipDataModel) {
        self.slipData = slipData
    }
    
    var itemsCount: Int {
        return slipData.itemData.count
    }

    // Computed properties or methods for other necessary data
    var marketName: String? {
        return slipData.marketName
    }
    
    var date: String? {
        return slipData.date
    }
    
    var time: String? {
        return slipData.time
    }

    func itemAtIndex(_ index: Int) -> UploadItem {
        return slipData.itemData[index]
    }
    
    func setBarcodeForItem(at index: Int, barcode: String) {
        slipData.itemData[index].barcodeID = barcode
    }

    func markItemAsScanned(at index: Int) {
        // Logic to mark item as scanned
        // Notify view about the update
        onItemsUpdated?()
    }
    
    // Methods to manipulate slipData and other properties
    // Example: Update slip data, fetch additional data, etc.
    
    func sendSlipData() async {
        do {
            try await sendDataToNetwork()
        } catch {
            print("Error sending slip data: \(error)")
        }
    }
    
    // In ViewModel
    private func sendDataToNetwork() async throws  {
        let dbManager = DatabaseManager()
        try await dbManager.createScan(for: slipData)
    }
}
