//
//  TitleLabel.swift
//  tutumlu
//
//  Created by ali-kerem on 17.11.2023.
//

import UIKit

class TitleLabel: UILabel {
    
    // You can add custom initializers if needed
    init() {
        super.init(frame: .zero)
        configureLabel()
    }
    
    // This initializer is required for initializing the view from a storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureLabel()
    }
    
    private func configureLabel() {
        text = "TUTUMLU"
        font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle).withSymbolicTraits([.traitBold, .traitItalic])!, size: 64)
        textColor = UIColor(hexString: "3EBD69")
        textAlignment = .center
        // Any other default styling
    }
}
