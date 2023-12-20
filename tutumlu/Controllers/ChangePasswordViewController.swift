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
        
        // Initialize your custom view and add it as a subview
        changePasswordView = ChangePasswordView()
        view.addSubview(changePasswordView)
        
        // Setup Auto Layout constraints or frames
        changePasswordView.frame = view.bounds // If not using Auto Layout
        changePasswordView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // If not using Auto Layout

        // Set up the rest of your view controller's view hierarchy and properties
        setupNavigationBar()
        
        setupBindings()
    }
    
    private func setupNavigationBar() {
        // Set the title of the navigation bar
        navigationItem.title = "Change Password"
        
    }
    
    private func setupBindings() {

    }
    

    @objc private func backButtonTapped() {
        // Code to handle the back button tap
        navigationController?.popViewController(animated: true)
    }

    @objc private func saveButtonTapped() {
        // Code to handle the profile button tap
    }
}
