//
//  LoginSignupViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 8.11.2023.
//

import UIKit

class LoginSignupViewController: UIViewController {
    
    private var loginSignupView: LoginSignupView!

    override func loadView() {
        loginSignupView = LoginSignupView()
        view = loginSignupView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupNavigationBar()
    }
    
    
    private func setupNavigationBar() {
        // Set the title of the navigation bar
        navigationItem.title = "Login or Sign up"
        
        // Optionally add a profile button to the right
        let profileImage = UIImage(named: "profileIcon")?.withRenderingMode(.alwaysOriginal) // Replace "profileIcon" with your image name
        let profileButton = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(profileButtonTapped))
        navigationItem.rightBarButtonItem = profileButton
    }
    
    private func setupBindings() {
        loginSignupView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginSignupView.signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func loginButtonTapped() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }

    @objc private func signupButtonTapped() {
        let signupVC = SignupViewController()
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
    @objc private func profileButtonTapped() {

    }

}
