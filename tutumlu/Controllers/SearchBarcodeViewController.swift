//
//  SearchBarcodeViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 29.12.2023.
//

import UIKit
import AVFoundation


class SearchBarcodeViewController: UIViewController {

    private var searchBarcodeView: SearchBarcodeView!

    override func loadView() {
        searchBarcodeView = SearchBarcodeView()
        view = searchBarcodeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
    }
    
    private func setupBindings() {
        searchBarcodeView.scanButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
    }
    

    // MARK: - Actions
    
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc private func scanButtonTapped() {
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)

        switch cameraAuthorizationStatus {
        case .notDetermined: // The user has not yet been asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    if granted {
                        self.navigateToScanVC()
                    } else {
                        self.showCameraAccessDeniedAlert()
                    }
                }
            }
        case .authorized: // The user has previously granted access to the camera.
            self.navigateToScanVC()
        case .restricted, .denied: // The user can't grant access due to restrictions or has previously denied access.
            self.showCameraAccessDeniedAlert()
        @unknown default:
            fatalError("Unknown camera authorization status")
        }
    }

    private func navigateToScanVC() {
        let scanVC = BarcodeScanViewController()
        scanVC.scanningContext = .searchItem
        scanVC.delegate = self
        navigationController?.pushViewController(scanVC, animated: true)
    }

    private func showCameraAccessDeniedAlert() {
        let alert = UIAlertController(
            title: "Camera Access Denied",
            message: "Please enable camera access for this app in your device settings to use the barcode scanning feature.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Settings", style: .cancel) { _ in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl)
            }
        })
        present(alert, animated: true)
    }

    
}


extension SearchBarcodeViewController: BarcodeScanViewControllerDelegate {    
    func barcodeDidScan(_ barcode: String, context: BarcodeScanningContext) {
        switch context {
            case .uploadSlip:
                return
            case .searchItem:
                var item = SearchData.items[1]
                item.name = barcode
                searchBarcodeView.itemPriceView.configure(with: item)
                searchBarcodeView.itemPriceView.isHidden = false
        }
    }
}
