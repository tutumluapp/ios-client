//
//  SearchBarcodeViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 29.12.2023.
//

import UIKit

class SearchBarcodeViewController: UIViewController {

    private var searchBarcodeView: SearchBarcodeView!

    override func loadView() {
        searchBarcodeView = SearchBarcodeView()
        view = searchBarcodeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
    }
    
    private func setupBindings() {
        searchBarcodeView.scanButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
    }
    

    // MARK: - Actions
    
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func scanButtonTapped() {
        let scanVC = BarcodeScanViewController()
        scanVC.delegate = self
        navigationController?.pushViewController(scanVC, animated: true)
        
    }
}


extension SearchBarcodeViewController: BarcodeScanViewControllerDelegate {
    func barcodeDidScan(_ barcode: String) {
        var item = SearchData.items[1]
        item.name = barcode
        searchBarcodeView.itemPriceView.configure(with: item)
        searchBarcodeView.itemPriceView.isHidden = false
    }
}
