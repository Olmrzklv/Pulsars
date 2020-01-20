//
//  PanController.swift
//  CameraNavigator
//
//  Created by Onur Ornek on 1/18/20.
//  Copyright © 2020 Onur Ornek. All rights reserved.
//

import Foundation

class PanController {
    let panRecognizer = UIPanGestureRecognizer()
    var enabled = false {
        didSet {
            panRecognizer.isEnabled = enabled
        }
    }
    private var latestTranslation = CGPoint.zero
    var delegate: PanDelegate?
    init() {
        panRecognizer.addTarget(self, action: #selector(didPan))
    }
    
    @objc func didPan(_ recognizer: UIPanGestureRecognizer) {
        switch(recognizer.state){
        case .began:
            latestTranslation = recognizer.translation(in: recognizer.view)
        case .changed:
            let newTranslation = recognizer.translation(in: recognizer.view)
            let panDelta = CGVector(dx: newTranslation.x - latestTranslation.x,
                                   dy: newTranslation.y - latestTranslation.y)
            latestTranslation = newTranslation
            delegate!.didPan(by: panDelta)
        default:
            break
        }
    }
}

protocol PanDelegate {
    func didPan(by vector: CGVector)
}
