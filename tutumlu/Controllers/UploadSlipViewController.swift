//
//  UploadSlipViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 31.12.2023.
//

import UIKit

class UploadSlipViewController: UIViewController {

    private var uploadSlipView: UploadSlipView!

    override func loadView() {
        uploadSlipView = UploadSlipView()
        view = uploadSlipView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
        setupNavigationBar()
    }
    
    private func setupBindings() {
        
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Upload Slip"
        
        addProfileButton(target: self, action: #selector(profileButtonTapped))
    }
    
    
    // MARK: - Actions
    
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func profileButtonTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
