//
//  ChangeProfileNameView.swift
//  tutumlu
//
//  Created by ali-kerem on 13.12.2023.
//

import UIKit

class ChangeProfileNameView: UIView {
    let profileView = UIView()
    let profileNameLabel = UILabel()
    let usernameLabel = UILabel()
    let profileNameTextField = UITextField()
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
        
        profileView.backgroundColor = .lightGray
        profileView.layer.cornerRadius = 10
        profileView.layer.masksToBounds = true
        
        // Profile Name Label
        profileNameLabel.text = "Profile Name"
        profileNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        profileNameLabel.textColor = .black
        profileView.addSubview(profileNameLabel)
        
        // Username Label
        usernameLabel.text = "@username"
        usernameLabel.font = UIFont.systemFont(ofSize: 18)
        usernameLabel.textColor = .gray
        profileView.addSubview(usernameLabel)

        // Configure and add the profile text field
        profileNameTextField.placeholder = "Enter new profile name..."
        profileNameTextField.borderStyle = .roundedRect

        // Configure and add the save button
        saveButton.setTitle("Save", for: .normal)

        // Add subviews
        addSubview(profileView)
        addSubview(profileNameTextField)
        addSubview(saveButton)
    }
    
    private func setupConstraints() {
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNameTextField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            profileView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            profileView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            profileView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            
            profileNameLabel.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 8),
            profileNameLabel.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 16),
            profileNameLabel.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -16),
            
            usernameLabel.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 16),
            usernameLabel.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -16),
            usernameLabel.bottomAnchor.constraint(equalTo: profileView.bottomAnchor, constant: -16),
            
            profileNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileNameTextField.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 120),
            profileNameTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            profileNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150),
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
}

