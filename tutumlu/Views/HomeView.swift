//
//  HomeView.swift
//  tutumlu
//
//  Created by ali-kerem on 1.12.2023.
//

import UIKit

class HomeView: UIView {
    
    let titleLabel = TitleLabel()
    let stackView = UIStackView()
    let searchButton = RoundedGreenButton()
    let uploadButton = RoundedGreenButton()
    
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
        searchButton.setTitle("Search Item", for: .normal)
        uploadButton.setTitle("Upload Slip", for: .normal)
        
        // Configure stack view
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        
        // Add buttons to the stack view
        stackView.addArrangedSubview(searchButton)
        stackView.addArrangedSubview(uploadButton)
        
        // Add subviews
        addSubview(titleLabel)
        addSubview(stackView)

        setupConstraints()
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
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            uploadButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
