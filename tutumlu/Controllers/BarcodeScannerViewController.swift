//
//  BarcodeScannerViewController.swift
//  tutumlu
//
//  Created by ali-kerem on 30.12.2023.
//

import AVFoundation
import UIKit


class BarcodeScanViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var scanningContext: BarcodeScanningContext = .uploadSlip
    
    weak var delegate: BarcodeScanViewControllerDelegate?

    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            failed()
            return
        }

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)

        captureSession.startRunning()
    }

    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }

        dismiss(animated: true)
    }

    func found(code: String) {
        delegate?.barcodeDidScan(code, context: scanningContext)
        navigationController?.popViewController(animated: true)
        // print(code)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

protocol BarcodeScanViewControllerDelegate: AnyObject {
    func barcodeDidScan(_ barcode: String, context: BarcodeScanningContext)
}

enum BarcodeScanningContext {
    case uploadSlip
    case searchItem
}


 /*
import UIKit
import AVFoundation
import CoreImage

class BarcodeScanViewController: UIViewController {
    weak var delegate: BarcodeScanViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        scanBarcodeFromImage(named: "An-example-of-QR-code")
    }

    func scanBarcodeFromImage(named imageName: String) {
        guard let image = UIImage(named: imageName),
              let ciImage = CIImage(image: image) else {
            print("Could not load image")
            return
        }

        let context = CIContext()
        let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: context, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])

        let features = detector?.features(in: ciImage)
        if let barcodeFeature = features?.first as? CIQRCodeFeature, let scannedBarcode = barcodeFeature.messageString {
            found(code: scannedBarcode)
        } else {
            print("No barcode found")
        }
    }

    func found(code: String) {
        delegate?.barcodeDidScan(code)
        navigationController?.popViewController(animated: true)
        print(code)
    }

    // Rest of your code...
}

protocol BarcodeScanViewControllerDelegate: AnyObject {
    func barcodeDidScan(_ barcode: String)
}

*/
