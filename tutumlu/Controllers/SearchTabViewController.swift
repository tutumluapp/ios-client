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
        
        let tabName = SearchNameViewController()
        let tabBarcode = SearchBarcodeViewController()

        // Do any additional setup after loading the view.
        
        // Create the root view controllers for each tab.
        tabName.tabBarItem = UITabBarItem(title: "Name", image: UIImage(systemName: "text.magnifyingglass"), selectedImage: nil)
        tabBarcode.tabBarItem = UITabBarItem(title: "Barcode", image: UIImage(systemName: "barcode.viewfinder"), selectedImage: nil)

        // Create the tab bar controller and set its view controllers.
        self.setViewControllers([tabName, tabBarcode], animated: true)
        
        setupNavigationBar()
    }
    
    
    private func setupNavigationBar() {
        navigationItem.title = "Search Item"
        addProfileButton(target: self, action: #selector(profileButtonTapped))
    }
    
    @objc private func profileButtonTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
