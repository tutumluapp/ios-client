//
//  SearchNameView.swift
//  tutumlu
//
//  Created by ali-kerem on 29.12.2023.
//

import UIKit

class SearchNameView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
    }


}
