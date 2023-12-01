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
        // Additional setup after loading the view
        setupBindings()
        setupNavigationBar()
    }
    
    private func setupBindings() {
        // Here you can setup bindings between your ViewModel and the HomeView
        // For example:
        // homeView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        // Set the title of the navigation bar
        navigationItem.title = "Home"
        
        // Optionally add a profile button to the right
        let profileImage = UIImage(named: "profileIcon")?.withRenderingMode(.alwaysOriginal) // Replace "profileIcon" with your image name
        let profileButton = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(profileButtonTapped))
        navigationItem.rightBarButtonItem = profileButton
    }
    
    // MARK: - Actions
    
    @objc private func searchButtonTapped() {
        // Handle search button tap
    }
    
    @objc private func uploadButtonTapped() {
        // Handle upload button tap
    }
    
    @objc private func backButtonTapped() {
        // Code to handle the back button tap
        navigationController?.popViewController(animated: true)
    }

    @objc private func profileButtonTapped() {
        // Code to handle the profile button tap
    }
}
