//
//  LoginViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 27.11.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginView: LoginView!
    
    private var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        loginView = LoginView()
        view.addSubview(loginView)
        
        // Setup Auto Layout constraints or frames
        loginView.frame = view.bounds // If not using Auto Layout
        loginView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // If not using Auto Layout

        setupNavigationBar()
        setupBindings()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Login"
    }
    
    private func setupBindings() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        Task {
            let isSuccess = await viewModel.login(email: loginView.emailTextField.text ?? "",
                                                  password: loginView.passwordTextField.text ?? "")
            if isSuccess {
                DispatchQueue.main.async {
                    let homeVC = HomeViewController()
                    self.navigationController?.setViewControllers([homeVC], animated: true)
                }
            } else {
                DispatchQueue.main.async {
                    self.presentLoginFailureAlert()
                }
            }
        }
    }
    
    private func presentLoginFailureAlert() {
        let alert = UIAlertController(title: "Login Failed", message: "Invalid credentials. Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }


    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
