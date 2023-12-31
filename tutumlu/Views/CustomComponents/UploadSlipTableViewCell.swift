//
//  UploadSlipTableViewCell.swift
//  tutumlu
//
//  Created by ali-kerem on 31.12.2023.
//

import UIKit

class UploadSlipTableViewCell: UITableViewCell {
    let namePriceStackView = UIStackView()
    let itemNameLabel = UILabel()
    let scanButton = UIButton(type: .system)
    let priceLabel = UILabel()
    
    var scanAction: (() -> Void)?
    
    var isScanned: Bool = false {
        didSet {
            scanButton.setTitle(isScanned ? "  Barcode scanned" : "  Scan barcode", for: .normal)
            let image = isScanned ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "barcode.viewfinder")
            scanButton.setImage(image, for: .normal)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        namePriceStackView.axis = .horizontal
        namePriceStackView.distribution = .fill
        namePriceStackView.alignment = .center
        namePriceStackView.spacing = 8
        
        itemNameLabel.textAlignment = .left

        priceLabel.textAlignment = .right
        
        let itemNameLabelContainer = UIView()
        let priceLabelContainer = UIView()
        
        itemNameLabelContainer.addSubview(itemNameLabel)
        priceLabelContainer.addSubview(priceLabel)
        
        namePriceStackView.addArrangedSubview(itemNameLabelContainer)
        namePriceStackView.addArrangedSubview(priceLabelContainer)
                
        scanButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
                
        contentView.addSubview(namePriceStackView)
        contentView.addSubview(scanButton)
        
        namePriceStackView.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: itemNameLabelContainer.topAnchor),
            itemNameLabel.leadingAnchor.constraint(equalTo: itemNameLabelContainer.leadingAnchor),
            itemNameLabel.trailingAnchor.constraint(equalTo: itemNameLabelContainer.trailingAnchor),
            itemNameLabel.bottomAnchor.constraint(equalTo: itemNameLabelContainer.bottomAnchor),
            
            
            priceLabel.topAnchor.constraint(equalTo: priceLabelContainer.topAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: priceLabelContainer.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceLabelContainer.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: priceLabelContainer.trailingAnchor, constant: -16),
            
            namePriceStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            namePriceStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            namePriceStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            scanButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            scanButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
    }
    
    private func setupConstraints () {
        
    }
    
    @objc private func scanButtonTapped() {
        scanAction?()
    }
    
    // Method to configure the cell with data
    func configure(with item: UploadItem) {
        itemNameLabel.text = item.name
        priceLabel.text = "Price : " + String(format: "%.2f", item.price)

        setNeedsLayout()
    }
}
