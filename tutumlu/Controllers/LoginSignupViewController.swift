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
        
        // Additional setup after loading the view
        setupBindings()
    }
    
    
    private func setupBindings() {
        // Here you can setup bindings between your ViewModel and the LoginSignupView
        // For example:
        loginSignupView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginSignupView.signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func loginButtonTapped() {

    }

    
    @objc private func signupButtonTapped() {

    }
    
}
