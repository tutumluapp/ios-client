//
//  LoginViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 27.11.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginView: LoginView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize your custom view and add it as a subview
        loginView = LoginView()
        view.addSubview(loginView)
        
        // Setup Auto Layout constraints or frames
        loginView.frame = view.bounds // If not using Auto Layout
        loginView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // If not using Auto Layout

        // Set up the rest of your view controller's view hierarchy and properties
        setupNavigationBar()
        
        setupBindings()
    }
    
    private func setupNavigationBar() {
        // Set the title of the navigation bar
        navigationItem.title = "Login"
        
        // Optionally add a profile button to the right
        let profileImage = UIImage(named: "profileIcon")?.withRenderingMode(.alwaysOriginal) // Replace "profileIcon" with your image name
        let profileButton = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(profileButtonTapped))
        navigationItem.rightBarButtonItem = profileButton
    }
    
    private func setupBindings() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        let homeVC = HomeViewController()
        navigationController?.setViewControllers([homeVC], animated: true)
    }

    @objc private func backButtonTapped() {
        // Code to handle the back button tap
        navigationController?.popViewController(animated: true)
    }

    @objc private func profileButtonTapped() {
        // Code to handle the profile button tap
    }
}
