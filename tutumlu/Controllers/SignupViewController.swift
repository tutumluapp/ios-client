//
//  SignupViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 20.11.2023.
//

import UIKit

class SignupViewController: UIViewController {
    
    private var signupView: SignupView!

    override func loadView() {
        signupView = SignupView()
        view = signupView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupNavigationBar()
    }
    
    private func setupBindings() {
        signupView.signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Sign up"
    }
    
    @objc private func signupButtonTapped() {
        let homeVC = HomeViewController()
        navigationController?.setViewControllers([homeVC], animated: true)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
