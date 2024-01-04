//
//  ItemPriceView.swift
//  tutumlu
//
//  Created by ali-kerem on 30.12.2023.
//

import UIKit

class ItemPriceView: UIView {
    
    let itemNameLabel = UILabel()
    let priceStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        itemNameLabel.text = "Item's Name"

        priceStackView.axis = .vertical

        addSubview(itemNameLabel)
        addSubview(priceStackView)
    }
    
    private func setupConstraints() {
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceStackView.translatesAutoresizingMaskIntoConstraints = false
        
        itemNameLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        itemNameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        priceStackView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        priceStackView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            itemNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            itemNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            priceStackView.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 16),
            priceStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priceStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            priceStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with item: SearchItemModel) {
        itemNameLabel.text = item.name
        
        let arrangedSubviews = priceStackView.arrangedSubviews
        for subview in arrangedSubviews {
            priceStackView.removeArrangedSubview(subview)
            subview.removeFromSuperview() // Important to remove the view from the view hierarchy
        }

        for priceInfo in item.priceInfo {
            let priceLabel = UILabel()
            priceLabel.translatesAutoresizingMaskIntoConstraints = false
            priceLabel.text = "Market: \(priceInfo.market) Price: \(priceInfo.price)"
            priceStackView.addArrangedSubview(priceLabel)
        }
    }
}
