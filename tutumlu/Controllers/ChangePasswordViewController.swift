//
//  ChangePasswordViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 20.12.2023.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    private var changePasswordView: ChangePasswordView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        changePasswordView = ChangePasswordView()
        view.addSubview(changePasswordView)
        
        // Setup Auto Layout constraints or frames
        changePasswordView.frame = view.bounds // If not using Auto Layout
        changePasswordView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // If not using Auto Layout

        setupNavigationBar()
        setupBindings()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Change Password"
    }
    
    private func setupBindings() {

    }
    

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func saveButtonTapped() {
        // Code to handle the profile button tap
    }
}
