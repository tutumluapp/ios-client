//
//  SearchNameViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 29.12.2023.
//

import UIKit

class SearchNameViewController: UIViewController {

    private var searchNameView: SearchNameView!

    override func loadView() {
        searchNameView = SearchNameView()
        view = searchNameView
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
