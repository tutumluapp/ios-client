//
//  UploadSlipViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 31.12.2023.
//

import UIKit

class UploadSlipViewController: UIViewController {

    private var uploadSlipView: UploadSlipView!
    
    private var slipData: SlipDataModel

    init(slipData: SlipDataModel) {
        self.slipData = slipData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        uploadSlipView.uploadButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)

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
    
    
    @objc private func uploadButtonTapped() {
        let uploadVC = SlipScannerViewController()
        navigationController?.pushViewController(uploadVC, animated: true)
    }
    
    
}

