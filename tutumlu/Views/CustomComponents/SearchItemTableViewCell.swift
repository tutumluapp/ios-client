//
//  SearchItemTableViewCell.swift
//  tutumlu
//
//  Created by ali-kerem on 30.12.2023.
//

import UIKit

class SearchItemTableViewCell: UITableViewCell {
    
    let itemNameLabel = UILabel()
    let toggleButton = UIButton(type: .system)
    let priceStackView = UIStackView()
    
    var toggleAction: (() -> Void)?
    
    var isExpanded: Bool = false {
        didSet {
            toggleButton.setTitle(isExpanded ? "Hide prices..." : "See prices...", for: .normal)
            let image = isExpanded ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
            toggleButton.setImage(image, for: .normal)
            priceStackView.isHidden = !isExpanded
            setupConstraints()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        itemNameLabel.text = "Item's Name"
        
        toggleButton.setTitle("See prices...", for: .normal)
        toggleButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        toggleButton.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        
        priceStackView.axis = .vertical
        priceStackView.isHidden = true // Initially hidden
        
        contentView.addSubview(itemNameLabel)
        contentView.addSubview(priceStackView)
        contentView.addSubview(toggleButton)
        }
    
    private func setupConstraints() {
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        priceStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            itemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            toggleButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            toggleButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            priceStackView.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 16),
            priceStackView.bottomAnchor.constraint(equalTo: toggleButton.topAnchor, constant: -16),
            priceStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
            
    }
    
    @objc private func toggleButtonTapped() {
        toggleAction?()
    }
    
    // Method to configure the cell with data
    func configure(with item: SearchItem) {
        itemNameLabel.text = item.name


        for priceInfo in item.priceInfo {
            let priceLabel = UILabel()
            priceLabel.translatesAutoresizingMaskIntoConstraints = false
            priceLabel.text = "Market: \(priceInfo.market) Price: $\(priceInfo.price)"
            priceStackView.addArrangedSubview(priceLabel)
        }
        
        priceStackView.isHidden = !isExpanded
        
        setNeedsLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Reset cell to default state
        itemNameLabel.text = nil
        priceStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        isExpanded = false
    }
}
