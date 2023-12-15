//
//  ChangeProfileNameView.swift
//  tutumlu
//
//  Created by ali-kerem on 13.12.2023.
//

import UIKit

class ChangeProfileNameView: UIView {
    let profileLabelView = ProfileLabelView()
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
        
        // Set labels
        profileLabelView.profileNameLabel.text = "Profile Name"
        profileLabelView.usernameLabel.text = "@username"

        // Configure and add the profile text field
        profileNameTextField.placeholder = "Enter new profile name..."
        profileNameTextField.borderStyle = .roundedRect

        // Configure and add the save button
        saveButton.setTitle("Save", for: .normal)

        // Add subviews
        addSubview(profileLabelView)
        addSubview(profileNameTextField)
        addSubview(saveButton)
    }
    
    private func setupConstraints() {
        profileLabelView.translatesAutoresizingMaskIntoConstraints = false
        profileNameTextField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            profileLabelView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileLabelView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            profileLabelView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            profileLabelView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            
            profileNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileNameTextField.topAnchor.constraint(equalTo: profileLabelView.bottomAnchor, constant: 120),
            profileNameTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            profileNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150),
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
}

