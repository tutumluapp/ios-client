//
//  ProfileViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 9.12.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var profileView: ProfileView!

    override func loadView() {
        profileView = ProfileView()
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
        setupNavigationBar()
    }
    
    private func setupBindings() {
        profileView.changeProfileNameButton.addTarget(self, action: #selector(changeProfileNameButtonTapped), for: .touchUpInside)
        profileView.changePasswordButton.addTarget(self, action: #selector(changePasswordButtonTapped), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Profile"
        
        let logoutImage = UIImage(systemName: "rectangle.portrait.and.arrow.forward")?.withRenderingMode(.alwaysTemplate)
        let logoutButton = UIBarButtonItem(image: logoutImage, style: .plain, target: self, action: #selector(logoutButtonTapped))
        logoutButton.tintColor = .white
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    // MARK: - Actions

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func logoutButtonTapped() {
        // Code to handle the profile button tap
    }
    
    @objc private func changeProfileNameButtonTapped() {
        let changeProfileNameVC = ChangeProfileNameViewController()
        navigationController?.pushViewController(changeProfileNameVC, animated: true)
    }
    
    @objc private func changePasswordButtonTapped() {
        let changePasswordVC = ChangePasswordViewController()
        navigationController?.pushViewController(changePasswordVC, animated: true)
    }

}
