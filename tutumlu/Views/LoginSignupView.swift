//
//  LoginSignupView.swift
//  tutumlu
//
//  Created by ali-kerem on 8.11.2023.
//

import UIKit

class LoginSignupView: UIView {
    
    let titleLabel = TitleLabel()
    let stackView = UIStackView()
    let loginButton = RoundedGreenButton()
    let signupButton = RoundedGreenButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        // Configure buttons
        loginButton.setTitle("Login", for: .normal)
        signupButton.setTitle("Sign Up", for: .normal)
        
        // Configure stack view
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        
        // Add buttons to the stack view
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(signupButton)
        
        // Add subviews
        addSubview(titleLabel)
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            // Title label constraints
            titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -50), // Adjust the constant as needed
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // Stack view constraints
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            signupButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
