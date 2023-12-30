//
//  SearchTabViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 29.12.2023.
//

import UIKit

final class SearchTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupNavigationBar()
    }

    private func setupTabBar() {
        let tabName = SearchNameViewController()
        let tabBarcode = SearchBarcodeViewController()
        
        tabName.tabBarItem = UITabBarItem(title: "Name", image: UIImage(systemName: "text.magnifyingglass"), selectedImage: nil)
        tabBarcode.tabBarItem = UITabBarItem(title: "Barcode", image: UIImage(systemName: "barcode.viewfinder"), selectedImage: nil)

        setViewControllers([tabName, tabBarcode], animated: true)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Search Item"
        addProfileButton(target: self, action: #selector(profileButtonTapped))
    }
    
    @objc private func profileButtonTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
