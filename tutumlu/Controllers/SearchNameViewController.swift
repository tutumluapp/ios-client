//
//  SearchNameViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 29.12.2023.
//

import UIKit

class SearchNameViewController: UIViewController, UISearchBarDelegate {

    private var searchNameView: SearchNameView!
    
    private let viewModel = SearchNameViewModel()


    override func loadView() {
        searchNameView = SearchNameView()
        view = searchNameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchNameView.searchBar.delegate = self
        
        self.hideKeyboardWhenTappedAround()
                
        viewModel.onUpdate = { [weak self] items in
            DispatchQueue.main.async {
                self?.searchNameView.updateItems(items)
            }
        }
    }
    
    // MARK: - Actions
    
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        searchNameView.searchBar.resignFirstResponder() // Dismiss the keyboard

        Task {
            await viewModel.fetchItems(for: searchText)
        }
    }
}
