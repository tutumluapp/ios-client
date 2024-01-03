//
//  SearchBarcodeViewModel.swift
//  tutumlu
//
//  Created by ali-kerem on 3.01.2024.
//

class SearchBarcodeViewModel {
    private var searchItem: SearchItemModel?
    private var currentIndex: Int = 0

    // Closure for updating the view when data is fetched
    var onUpdate: ((SearchItemModel) -> Void)?

    func fetchItemDetails(for barcode: String) {
        // Alternative
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

        // Here you can add your network request logic
        // For now, just calling the update closure with the current item
        if let item = searchItem {
            self.onUpdate?(item)
        }

        // Uncomment and modify the below network request as per your needs
        /*
        APIManager.fetchItemDetails(barcode: barcode) { [weak self] result in
            switch result {
            case .success(let item):
                self?.onUpdate?(item)
            case .failure(let error):
                print(error.localizedDescription)
                // Handle error case, possibly using another closure or a state variable
            }
        }
        */
    }
}
