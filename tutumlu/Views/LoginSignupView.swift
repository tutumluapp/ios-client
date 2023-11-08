//
//  LoginSignupView.swift
//  tutumlu
//
//  Created by ali-kerem on 8.11.2023.
//

import UIKit

class LoginSignupView: UIView {
    
    let titleLabel = UILabel()
    let stackView = UIStackView()
    let loginButton = UIButton()
    let signupButton = UIButton()
    
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
        
        titleLabel.text = "TUTUMLU"
        titleLabel.font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle).withSymbolicTraits([.traitBold, .traitItalic])!, size: 64)
        titleLabel.textColor = .green
        titleLabel.textAlignment = .center
        
        // Configure buttons
        loginButton.backgroundColor = .green
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        loginButton.setTitle("Login", for: .normal)
        
        
        signupButton.backgroundColor = .green
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.layer.cornerRadius = 10
        signupButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
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
