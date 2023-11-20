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
    }
    
    private func setupBindings() {
        signupView.signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    
    
    @objc private func signupButtonTapped() {
        
    }
}
