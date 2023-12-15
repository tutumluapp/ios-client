//
//  ProfileLabelView.swift
//  tutumlu
//
//  Created by ali-kerem on 15.12.2023.
//

import UIKit

class ProfileLabelView: UIView {
    let profileNameLabel = UILabel()
    let usernameLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        // Profile Name Label
        profileNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        profileNameLabel.textColor = .black
        
        // Username Label
        usernameLabel.font = UIFont.systemFont(ofSize: 18)
        usernameLabel.textColor = .gray

        // Add subviews
        addSubview(profileNameLabel)
        addSubview(usernameLabel)
    }
    
    private func setupConstraints() {
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            profileNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            usernameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
}

