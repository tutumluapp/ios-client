//
//  ProfileView.swift
//  tutumlu
//
//  Created by ali-kerem on 9.12.2023.
//

import UIKit

class ProfileView: UIView {
    
    let profileLabelView = ProfileLabelView()
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
        
        // Set labels
        profileLabelView.profileNameLabel.text = "Profile Name"
        profileLabelView.usernameLabel.text = "@username"

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
        addSubview(profileLabelView)
        addSubview(stackView)

        setupConstraints()
    }
    
    private func setupConstraints() {
        profileLabelView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Profile label constraints
            profileLabelView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileLabelView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -150),
            profileLabelView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            profileLabelView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            
            // Stack view constraints
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -250),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            changeProfileNameButton.heightAnchor.constraint(equalToConstant: 50),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
