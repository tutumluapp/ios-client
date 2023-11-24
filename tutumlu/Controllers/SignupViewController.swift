//
//  SignupViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 20.11.2023.
//

import UIKit

class SignupViewController: UIViewController {
    
    private var signupView: SignupView!

    override func loadView() {
        signupView = SignupView()
        view = signupView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupNavigationBar()
    }
    
    private func setupBindings() {
        signupView.signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        // Set the title of the navigation bar
        navigationItem.title = "Sign up"
        
        // Optionally add a profile button to the right
        let profileImage = UIImage(named: "profileIcon")?.withRenderingMode(.alwaysOriginal) // Replace "profileIcon" with your image name
        let profileButton = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(profileButtonTapped))
        navigationItem.rightBarButtonItem = profileButton
    }
    
    @objc private func signupButtonTapped() {
    }
    
    @objc private func backButtonTapped() {
        
        navigationController?.popViewController(animated: true)
    }

    @objc private func profileButtonTapped() {

    }
}
