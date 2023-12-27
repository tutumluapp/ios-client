//
//  HomeViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 1.12.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeView: HomeView!

    override func loadView() {
        homeView = HomeView()
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
        setupNavigationBar()
    }
    
    private func setupBindings() {

    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Home"
        
        addProfileButton(target: self, action: #selector(profileButtonTapped))
    }
    
    // MARK: - Actions
    
    @objc private func searchButtonTapped() {
        // Handle search button tap
    }
    
    @objc private func uploadButtonTapped() {
        // Handle upload button tap
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func profileButtonTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
