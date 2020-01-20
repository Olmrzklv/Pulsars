//
//  RotationController.swift
//  CameraNavigator
//
//  Created by Onur Ornek on 1/18/20.
//  Copyright © 2020 Onur Ornek. All rights reserved.
//

import Foundation

class RotationController {
    let rotationRecognizer = UIRotationGestureRecognizer()
    var enabled = false {
        didSet {
            rotationRecognizer.isEnabled = enabled
        }
    }
    private var latestRotation = CGFloat(integerLiteral: 0)
    var delegate: RotationDelegate?
    init() {
        rotationRecognizer.addTarget(self, action: #selector(didRotate))
    }
    
    @objc func didRotate(_ recognizer: UIRotationGestureRecognizer) {
        switch(recognizer.state){
        case .began:
            latestRotation = recognizer.rotation
        case .changed:
            let newRotation = recognizer.rotation
            let rotationDelta = newRotation - latestRotation
            latestRotation = newRotation
            delegate!.didRotate(by: rotationDelta)
        default:
            break
        }
    }
}

protocol RotationDelegate {
    func didRotate(by angle: CGFloat)
}
