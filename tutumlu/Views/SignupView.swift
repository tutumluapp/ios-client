//
//  SignupView.swift
//  tutumlu
//
//  Created by ali-kerem on 20.11.2023.
//

import UIKit

class SignupView: UIView {
    
    let titleLabel = TitleLabel()
    let stackView = UIStackView()
    let emailTextField = UITextField()
    let profileNameTextField = UITextField()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let repeatPasswordTextField = UITextField()
    let signupButton = RoundedGreenButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        // Profile name
        emailTextField.placeholder = "Enter email..."
        emailTextField.borderStyle = .roundedRect
        
        // Profile name
        profileNameTextField.placeholder = "Enter profile name..."
        profileNameTextField.borderStyle = .roundedRect

        // Configure and add the username text field
        usernameTextField.placeholder = "Enter username..."
        usernameTextField.borderStyle = .roundedRect

        // Configure and add the password text field
        passwordTextField.placeholder = "Enter password..."
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        
        // Configure and add the repeat password text field
        repeatPasswordTextField.placeholder = "Repeat password..."
        repeatPasswordTextField.borderStyle = .roundedRect
        repeatPasswordTextField.isSecureTextEntry = true
        
        // Configure stack view
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(profileNameTextField)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(repeatPasswordTextField)
        
        // Configure and add the signup button
        signupButton.setTitle("Sign Up", for: .normal)

        // Add subviews
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(signupButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        signupButton.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            // Title label constraints
            titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -50), // Adjust the constant as needed
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // Stack view constraints
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: signupButton.topAnchor, constant: -50),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Signup button constraints
            signupButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
            signupButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signupButton.heightAnchor.constraint(equalToConstant: 50),
            signupButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
}
