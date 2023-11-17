//
//  RoundedGreenButton.swift
//  tutumlu
//
//  Created by ali-kerem on 17.11.2023.
//

import UIKit

class RoundedGreenButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton()
    }
    
    private func configureButton() {
        backgroundColor = UIColor(hexString: "3EBD69")
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        // Add any other styling you want for your primary action buttons
    }
}
