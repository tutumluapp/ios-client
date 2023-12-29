//
//  SearchBarcodeView.swift
//  tutumlu
//
//  Created by ali-kerem on 29.12.2023.
//

import UIKit

class SearchBarcodeView: UIView {
    
    let scanButton = RoundedGreenButton()

    
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
        
        scanButton.setTitle("Scan Barcode", for: .normal)
        
        addSubview(scanButton)
    }

    
    private func setupConstraints() {
        scanButton.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            scanButton.heightAnchor.constraint(equalToConstant: 100),
            scanButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            scanButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            scanButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
        ])
    }

}
