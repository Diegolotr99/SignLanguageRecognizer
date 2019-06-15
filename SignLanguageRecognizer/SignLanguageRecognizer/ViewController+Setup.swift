//
//  ViewController+Setup.swift
//  SignLanguageRecognizer
//
//  Created by aivatra on 6/15/19.
//  Copyright © 2019 aivatradev. All rights reserved.
//

import Foundation

extension ViewController {
    func setupLayout() -> Void {
        // Camera Layout
        previewLayer.frame = self.view.frame
        
        // PredictLabel
        predictLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }
    }
}
