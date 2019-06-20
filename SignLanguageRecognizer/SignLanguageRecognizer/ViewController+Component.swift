//
//  ViewController+Component.swift
//  SignLanguageRecognizer
//
//  Created by aivatra on 6/15/19.
//  Copyright © 2019 aivatradev. All rights reserved.
//

import Foundation
import AVKit

extension ViewController {
    func createComponent() {
        
        // Add capture session
        captureSession = AVCaptureSession()
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        captureSession.startRunning()
        
        // Add Preview Layer To give the Output to the application
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        predictLabel = UILabel()
        predictLabel.textAlignment = .center
        predictLabel.backgroundColor = UIColor.white
        predictLabel.textColor = UIColor.black
        predictLabel.font = predictLabel.font.withSize(35)
        predictLabel.numberOfLines = 0
        predictLabel.sizeToFit()
        
        // Add gesture recognizer
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinch(_:)))
        self.view.addGestureRecognizer(pinchGesture)
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer? = nil) {
        guard let captureDevice = AVCaptureDevice.default(for: .video), let sender = sender else { return }

        if sender.state == .changed {
            
            let maxZoomFactor = captureDevice.activeFormat.videoMaxZoomFactor
            let pinchVelocityDividerFactor: CGFloat = 5.0
            
            do {
                
                try captureDevice.lockForConfiguration()
                defer { captureDevice.unlockForConfiguration() }
                
                let desiredZoomFactor = captureDevice.videoZoomFactor + atan2(sender.velocity, pinchVelocityDividerFactor)
                captureDevice.videoZoomFactor = max(1.0, min(desiredZoomFactor, maxZoomFactor))
                
            } catch {
                print(error)
            }
        }
    }
}
