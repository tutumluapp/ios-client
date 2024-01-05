//
//  SignupViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 20.11.2023.
//

import UIKit

class SignupViewController: UIViewController {
    
    private var signupView: SignupView!
    
    private var viewModel = SignupViewModel()

    override func loadView() {
        signupView = SignupView()
        view = signupView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

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
        guard passwordsMatch() else {
            presentPasswordMismatchAlert()
            return
        }
        Task {
            await viewModel.signup(username: signupView.usernameTextField.text ?? "",
                                   profileName: signupView.profileNameTextField.text ?? "",
                                   email: signupView.emailTextField.text ?? "",
                                   password: signupView.passwordTextField.text ?? "")
        }
        let loginVC = LoginViewController()
        navigationController?.setViewControllers([loginVC], animated: true)

        
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func passwordsMatch() -> Bool {
        return signupView.passwordTextField.text == signupView.repeatPasswordTextField.text
    }
    
    private func presentPasswordMismatchAlert() {
        let alert = UIAlertController(title: "Password Mismatch", message: "Please ensure the passwords match.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
