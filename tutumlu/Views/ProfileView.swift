//
//  ProfileView.swift
//  tutumlu
//
//  Created by ali-kerem on 9.12.2023.
//

import UIKit

class ProfileView: UIView {
    
    let profileView = UIView()
    let profileNameLabel = UILabel()
    let usernameLabel = UILabel()
    let stackView = UIStackView()
    let changeProfileNameButton = RoundedGreenButton()
    let changePasswordButton = RoundedGreenButton()
    
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
        
        // Configure buttons
        changeProfileNameButton.setTitle("Change Profile Name", for: .normal)
        changePasswordButton.setTitle("Change Password", for: .normal)
        
        // Configure stack view
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        
        // Add buttons to the stack view
        stackView.addArrangedSubview(changeProfileNameButton)
        stackView.addArrangedSubview(changePasswordButton)
        
        // Add subviews
        addSubview(profileView)
        addSubview(stackView)

        setupConstraints()
    }
    
    private func setupConstraints() {
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints for profileView - Adjust the constants as needed
        NSLayoutConstraint.activate([
            profileView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -150),
            profileView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            profileView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            
            profileNameLabel.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 8),
            profileNameLabel.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 16),
            profileNameLabel.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -16),
            
            usernameLabel.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 16),
            usernameLabel.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -16),
            usernameLabel.bottomAnchor.constraint(equalTo: profileView.bottomAnchor, constant: -16),
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -250),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            changeProfileNameButton.heightAnchor.constraint(equalToConstant: 50),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
