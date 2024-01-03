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
    let priceLabel = UILabel()
    
    let scanButtonBarcodeStackView = UIStackView()
    let scanButton = UIButton(type: .system)
    let barcodeLabel = UILabel()
    
    weak var delegate: UploadSlipTableViewCellDelegate?
    
    var scanAction: (() -> Void)?
    
    var isScanned: Bool = false {
        didSet {
            scanButton.setTitle(isScanned ? "  Barcode scanned" : "  Scan barcode", for: .normal)
            let image = isScanned ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "barcode.viewfinder")
            scanButton.setImage(image, for: .normal)
            barcodeLabel.isHidden = isScanned ? false : true
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
        // Top stack view to hold item name and price info
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
        
        
        // Bottom stack view to hold scan button and barcode id
        scanButtonBarcodeStackView.axis = .horizontal
        scanButtonBarcodeStackView.distribution = .fill
        scanButtonBarcodeStackView.alignment = .center
        scanButtonBarcodeStackView.spacing = 8
        
        barcodeLabel.textAlignment = .right
        barcodeLabel.font = UIFont.systemFont(ofSize: 15)
        
        let barcodeLabelContainer = UIView()
        
        barcodeLabelContainer.addSubview(barcodeLabel)
        
        scanButtonBarcodeStackView.addArrangedSubview(scanButton)
        scanButtonBarcodeStackView.addArrangedSubview(barcodeLabelContainer)
        
                
        scanButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
                
        contentView.addSubview(namePriceStackView)
        contentView.addSubview(scanButtonBarcodeStackView)
        
        namePriceStackView.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scanButtonBarcodeStackView.translatesAutoresizingMaskIntoConstraints = false
        barcodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            barcodeLabel.topAnchor.constraint(equalTo: barcodeLabelContainer.topAnchor),
            barcodeLabel.bottomAnchor.constraint(equalTo: barcodeLabelContainer.bottomAnchor),
            barcodeLabel.leadingAnchor.constraint(equalTo: barcodeLabelContainer.leadingAnchor),
            barcodeLabel.trailingAnchor.constraint(equalTo: barcodeLabelContainer.trailingAnchor, constant: -16),
            
            
            scanButtonBarcodeStackView.topAnchor.constraint(equalTo: namePriceStackView.bottomAnchor, constant: 16),
            scanButtonBarcodeStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            scanButtonBarcodeStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupConstraints () {
        
    }
    
    @objc private func scanButtonTapped() {
        // print("Scan button tapped at the cell")
        delegate?.didTapScanButton(in: self)
    }
    
    // Method to configure the cell with data
    func configure(with item: UploadItem) {
        itemNameLabel.text = item.name
        priceLabel.text = "Price : " + String(format: "%.2f", item.price!)
        barcodeLabel.text = "ID: \(item.barcodeID ?? "Not found")"

        setNeedsLayout()
    }
}

protocol UploadSlipTableViewCellDelegate: AnyObject {
    func didTapScanButton(in cell: UploadSlipTableViewCell)
}
