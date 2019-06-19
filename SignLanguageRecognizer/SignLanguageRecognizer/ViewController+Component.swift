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
    }
}
