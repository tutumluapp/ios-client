//
//  ProfileViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 9.12.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var profileView: ProfileView!

    override func loadView() {
        profileView = ProfileView()
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup after loading the view
        setupBindings()
        setupNavigationBar()
    }
    
    private func setupBindings() {

    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Profile"
        
        let logoutImage = UIImage(systemName: "rectangle.portrait.and.arrow.forward")?.withRenderingMode(.alwaysOriginal)
        let logoutButton = UIBarButtonItem(image: logoutImage, style: .plain, target: self, action: #selector(logoutButtonTapped))
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    // MARK: - Actions

    @objc private func backButtonTapped() {
        // Code to handle the back button tap
        navigationController?.popViewController(animated: true)
    }

    @objc private func logoutButtonTapped() {
        // Code to handle the profile button tap
    }
}
