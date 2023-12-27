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
        navigationItem.title = "Login or Sign up"
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
}
