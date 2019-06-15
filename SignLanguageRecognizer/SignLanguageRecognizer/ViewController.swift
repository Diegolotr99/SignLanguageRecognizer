//
//  ViewController.swift
//  SignLanguageRecognizer
//
//  Created by aivatra on 6/4/19.
//  Copyright © 2019 aivatradev. All rights reserved.
//

import UIKit
import AVKit
import Vision
import CoreML
import SnapKit

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var predictLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI
        createComponent()
        addPredictionInfoSubview()
        setupLayout()
        
        // Vision & CoreML
        captureFrame()
        
    }

}

