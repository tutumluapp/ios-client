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
        
    }
    

    // MARK: - Actions
    
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
