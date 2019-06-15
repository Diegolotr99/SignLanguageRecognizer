//
//  ViewController+Capture.swift
//  SignLanguageRecognizer
//
//  Created by aivatra on 6/15/19.
//  Copyright © 2019 aivatradev. All rights reserved.
//

import Foundation
import AVKit
import Vision // Machine Learning Library Using To detect object

extension ViewController {
    func captureFrame() {
//         add it to the capture session
        let dataOutput = AVCaptureVideoDataOutput()

        // creates a custom queue
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))

        captureSession.addOutput(dataOutput)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        //        print("camera was able to capture a frame: \(Date())")
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        // model goes here!
        guard let model = try? VNCoreMLModel(for: SignClassifier().model) else { return }
        
        let request = VNCoreMLRequest(model: model) { (req, err) in
            
            guard let results = req.results as? [VNClassificationObservation] else { return }
            guard let firstObservation = results.first else { return }
            
            print(firstObservation.identifier, firstObservation.confidence)
            DispatchQueue.main.async {
                self.predictLabel.text = "\(firstObservation.identifier), \((firstObservation.confidence * 100).rounded())"
            }
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
}
