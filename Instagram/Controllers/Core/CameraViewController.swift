//
//  CameraViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 15/09/2023.
//

import UIKit
import AVFoundation
import SDWebImage

class CameraViewController: UIViewController {
    private let output = AVCapturePhotoOutput()
    private var captureSession: AVCaptureSession?
    private let previewLayer = AVCaptureVideoPreviewLayer()

    private let shutterButton: UIButton = {
        let custom = UIButton()
        custom.clipsToBounds = true
        custom.layer.masksToBounds = true
        custom.layer.borderWidth = 10
        custom.layer.borderColor = UIColor.gray.cgColor
        custom.backgroundColor = .white
        
        custom.layer.cornerCurve = .circular
        return custom
    }()
    
    private let cameraLiveView: UIView = {
        let custom = UIView()
        custom.backgroundColor = .black
        return custom
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Camera"
        view.backgroundColor = .systemGray
        
        setupNavBar()
        checkCameraPermission()
        
        shutterButton.addTarget(self, action: #selector(shutterButtonTapped), for: .touchUpInside)
        view.addSubview(shutterButton)
        
        view.addSubview(cameraLiveView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        if let session = captureSession, !session.isRunning {
            captureSession?.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        captureSession?.stopRunning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cameraLiveView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height - view.width)
        previewLayer.frame = cameraLiveView.bounds
        
        let shutterButtonSize = 70.0
        let shutterButtonPosition = view.height - cameraLiveView.height
        shutterButton.layer.cornerRadius = shutterButtonSize / 2
        shutterButton.layer.cornerCurve = .circular
        shutterButton.frame = CGRect(x: ((view.width-shutterButtonSize) / 2),
                                     y: ((cameraLiveView.bottom - view.safeAreaInsets.bottom) + ((shutterButtonPosition + shutterButtonSize) / 2)),
                                     width: shutterButtonSize,
                                     height: shutterButtonSize)
    }
    
    private func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    private func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .restricted, .denied:
                break
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                    guard granted else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.setupCamera()
                    }
                }
            case .authorized:
                setupCamera()
            @unknown default:
                break
        }
    }
    
    private func setupCamera() {
        let captureSession = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let caputeInput = try AVCaptureDeviceInput(device: device)
                if captureSession.canAddInput(caputeInput) {
                    captureSession.addInput(caputeInput)
                }
            } catch {
                print("Error in Camera Setup: \(error)")
            }
            
            if captureSession.canAddOutput(output) {
                captureSession.addOutput(output)
            }
            
            previewLayer.session = captureSession
            previewLayer.videoGravity = .resizeAspectFill
            cameraLiveView.layer.addSublayer(previewLayer)
            captureSession.startRunning()
        }
    }

    @objc func didTapClose() {
        tabBarController?.selectedIndex = 0
        tabBarController?.tabBar.isHidden = false
    }
    
    @objc func shutterButtonTapped() {
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
    }
}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation(), let image = UIImage(data: data) else { return }
        captureSession?.stopRunning()
        guard let fixedImage = image.sd_resizedImage(with: CGSize(width: 640, height: 640), scaleMode: .aspectFill) else { return }
        let imageEditVC = PostEditViewController(image: image)
        if #available(iOS 14.0, *) {
            imageEditVC.navigationItem.backButtonDisplayMode = .minimal
        }
        navigationController?.pushViewController(imageEditVC, animated: true)
    }
}
