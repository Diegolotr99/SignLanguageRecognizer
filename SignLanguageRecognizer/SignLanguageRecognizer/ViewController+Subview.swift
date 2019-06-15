//
//  ViewController+Subview.swift
//  SignLanguageRecognizer
//
//  Created by aivatra on 6/15/19.
//  Copyright © 2019 aivatradev. All rights reserved.
//

import Foundation

extension ViewController {
    func addPredictionInfoSubview() {
        self.view.layer.addSublayer(previewLayer)
        self.view.addSubview(predictLabel)
    }
}
