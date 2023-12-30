//
//  SearchBarcodeView.swift
//  tutumlu
//
//  Created by ali-kerem on 29.12.2023.
//

import UIKit

class SearchBarcodeView: UIView {
    
    let scanButton = RoundedGreenButton()
    let itemPriceView = ItemPriceView()

    
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
        
        itemPriceView.isHidden = true
                
        scanButton.setTitle("Scan Barcode", for: .normal)
        
        addSubview(itemPriceView)
        addSubview(scanButton)
    }

    
    private func setupConstraints() {
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        itemPriceView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            itemPriceView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            itemPriceView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemPriceView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            scanButton.heightAnchor.constraint(equalToConstant: 100),
            scanButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
            scanButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            scanButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }

}
