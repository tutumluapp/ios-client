//
//  HomeViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 1.12.2023.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    private var homeView: HomeView!

    override func loadView() {
        homeView = HomeView()
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
        setupNavigationBar()
    }
    
    private func setupBindings() {
        homeView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        homeView.uploadButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Home"
        
        addProfileButton(target: self, action: #selector(profileButtonTapped))
    }
    
    // MARK: - Actions
    
    @objc private func searchButtonTapped() {
        let searchVC = SearchTabViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc private func uploadButtonTapped() {
        // Alternative
        checkCameraPermissionsAndOpenCamera()
        // self.processAndUploadImage(UIImage(named: "Image")!)
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func profileButtonTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func checkCameraPermissionsAndOpenCamera() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            openCamera()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async {
                        self.openCamera()
                    }
                }
            }
        case .denied, .restricted:
            // Handle permission denied
            break
        @unknown default:
            break
        }
    }
    
    private func openCamera() {
        let imagePickerController = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerController.sourceType = .camera
            imagePickerController.delegate = self
            present(imagePickerController, animated: true)
        } else {
            // Handle camera not available
        }
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true) {
            if let image = info[.originalImage] as? UIImage {
                self.processAndUploadImage(image)
            }
        }
    }

    private func processAndUploadImage(_ image: UIImage) {
        let loadingIndicator = showLoadingIndicator()

        DispatchQueue.global(qos: .userInitiated).async {
            let correctedImage = self.correctImageOrientation(image)
            let processedImage = ImagePreProcessor.preprocessImage(correctedImage)
            let imageProcessor = SlipParser()
            imageProcessor.performTextRecognition(on: processedImage!) { slipData in
                DispatchQueue.main.async {
                    loadingIndicator.dismiss(animated: true) {
                        if let slipData = slipData {
                            self.navigateToUploadSlipViewController(with: slipData)
                        } else {
                            // Handle error
                        }
                    }
                }
            }
        }
    }

    private func showLoadingIndicator() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        return alert
    }

    private func navigateToUploadSlipViewController(with slipData: SlipDataModel) {
        let viewModel = UploadSlipViewModel(slipData: slipData)
        let uploadVC = UploadSlipViewController(viewModel: viewModel)
        navigationController?.pushViewController(uploadVC, animated: true)
    }
    
    private func correctImageOrientation(_ image: UIImage) -> UIImage {
        if image.imageOrientation == .up {
            return image
        }

        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        image.draw(in: CGRect(origin: .zero, size: image.size))
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return normalizedImage
    }
}
