//
//  UploadSlipViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 31.12.2023.
//

import UIKit

class UploadSlipViewController: UIViewController {
    
    private var uploadSlipView: UploadSlipView!
    private var viewModel: UploadSlipViewModel?
    
    var selectedIndexPathForScan: IndexPath?
    
    init(viewModel: UploadSlipViewModel) {
        self.viewModel = viewModel
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
        uploadSlipView.delegate = self

        setupBindings()
        setupNavigationBar()
        uploadSlipView.viewModel = viewModel
    }
    
    private func setupBindings() {
        uploadSlipView.uploadButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)
        
        viewModel?.onItemsUpdated = { [weak self] in
            self?.uploadSlipView.tableView.reloadData()
        }

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
        Task {
            await viewModel?.sendSlipData()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    private func navigateToScanVC() {
        // Alternative
        /*
        let scanVC = BarcodeScanViewController()
        scanVC.scanningContext = .uploadSlip
        scanVC.delegate = self
        navigationController?.pushViewController(scanVC, animated: true)
        */
        barcodeDidScan("80817222", context: .uploadSlip)
    }
    
    
}


extension UploadSlipViewController: UploadSlipViewDelegate {
    func didTapScanButton(_ view: UploadSlipView, didTapScanButtonForItemAt indexPath: IndexPath) {
        // print("Scan button tap delegated to VC")
        selectedIndexPathForScan = indexPath
        navigateToScanVC()
    }
}

extension UploadSlipViewController: BarcodeScanViewControllerDelegate {
    func barcodeDidScan(_ barcode: String, context: BarcodeScanningContext) {
        switch context {
            case .uploadSlip:
                // print("barcode was scanned with value \(barcode) for cell idx : \(selectedIndexPathForScan ?? [0,-1])")
                handleUploadSlipBarcode(barcode)
                uploadSlipView.tableView.reloadRows(at: [selectedIndexPathForScan!], with: .automatic)

            case .searchItem:
                return
        }
    }
    
    private func handleUploadSlipBarcode(_ barcode: String) {
        if let indexPath = selectedIndexPathForScan {
            viewModel?.setBarcodeForItem(at: indexPath.row, barcode: barcode)
        }
    }
}
