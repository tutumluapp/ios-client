//
//  ChangeProfileNameViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 13.12.2023.
//

import UIKit

class ChangeProfileNameViewController: UIViewController {
    
    private var changeProfileNameView: ChangeProfileNameView!

    override func loadView() {
        changeProfileNameView = ChangeProfileNameView()
        view = changeProfileNameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        setupBindings()
        setupNavigationBar()
    }
    
    private func setupBindings() {
        
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Change Profile Name"
    }
    
    // MARK: - Actions
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
