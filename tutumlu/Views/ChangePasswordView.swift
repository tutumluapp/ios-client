//
//  ChangePasswordView.swift
//  tutumlu
//
//  Created by ali-kerem on 20.12.2023.
//

import UIKit

class ChangePasswordView: UIView {
    
    let stackView = UIStackView()
    let oldpasswordTextField = UITextField()
    let newPasswordTextField = UITextField()
    let repeatNewPasswordTextField = UITextField()
    let saveButton = RoundedGreenButton()

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

        // Configure and add the old password text field
        oldpasswordTextField.placeholder = "Enter old password..."
        oldpasswordTextField.borderStyle = .roundedRect
        oldpasswordTextField.isSecureTextEntry = true
        
        // Configure and add the new password text field
        newPasswordTextField.placeholder = "Enter new password..."
        newPasswordTextField.borderStyle = .roundedRect
        newPasswordTextField.isSecureTextEntry = true
        
        // Configure and add the repeat new password text field
        repeatNewPasswordTextField.placeholder = "Repeat new password..."
        repeatNewPasswordTextField.borderStyle = .roundedRect
        repeatNewPasswordTextField.isSecureTextEntry = true
        
        // Configure stack view
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        
        stackView.addArrangedSubview(oldpasswordTextField)
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(repeatNewPasswordTextField)

        // Configure and add the login button
        saveButton.setTitle("Save", for: .normal)

        // Add subviews
        addSubview(stackView)
        addSubview(saveButton)
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            // Stack view constraints
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            oldpasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            newPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            repeatNewPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
}

