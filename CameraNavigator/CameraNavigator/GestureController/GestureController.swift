//
//  GestureController.swift
//  CameraNavigator
//
//  Created by Onur Ornek on 1/18/20.
//  Copyright © 2020 Onur Ornek. All rights reserved.
//

import Foundation


class GestureController {
    let panController = PanController()
    let pinchController = PinchController()
    let rotationController = RotationController()
    
    init(with view: UIView) {
        setView(to: view)
    }
    
    var enabled = false {
        didSet {
            panController.enabled = enabled
            rotationController.enabled = enabled
            //Note that pinch controller is always enabled
        }
    }
    
    var delegate: GestureDelegate? {
        didSet {
            panController.delegate = delegate
            pinchController.delegate = delegate
            rotationController.delegate = delegate
        }
    }
    
    func setView(to view: UIView){
        view.addGestureRecognizer(panController.panRecognizer)
        view.addGestureRecognizer(pinchController.pinchRecognizer)
        view.addGestureRecognizer(rotationController.rotationRecognizer)
    }
}

protocol GestureDelegate: PanDelegate, RotationDelegate, PinchDelegate {}
