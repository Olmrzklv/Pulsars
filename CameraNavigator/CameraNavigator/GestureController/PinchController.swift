//
//  PinchController.swift
//  CameraNavigator
//
//  Created by Onur Ornek on 1/18/20.
//  Copyright © 2020 Onur Ornek. All rights reserved.
//

import Foundation


class PinchController {
    let pinchRecognizer = UIPinchGestureRecognizer()
    var delegate: PinchDelegate?
    
    private var latestScale = CGFloat(integerLiteral: 1)
    init() {
        pinchRecognizer.addTarget(self, action: #selector(didPinch))
    }
    
    @objc func didPinch(_ recognizer: UIPinchGestureRecognizer) {
        switch(recognizer.state){
        case .began:
            latestScale = recognizer.scale
        case .changed:
            let newScale = recognizer.scale
            let scalingRatio = newScale / latestScale
            latestScale = newScale
            delegate!.didScale(by: scalingRatio)
        default:
            break
        }
    }
}

protocol PinchDelegate {
    func didScale(by ratio: CGFloat)
}
