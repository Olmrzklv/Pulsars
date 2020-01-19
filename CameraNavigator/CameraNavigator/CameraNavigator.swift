//
//  CameraNavigator.swift
//  CameraNavigator
//
//  Created by Onur Ornek on 1/18/20.
//  Copyright © 2020 Onur Ornek. All rights reserved.
//

import Foundation
import UIKit
import SceneKit

public protocol CameraNavigatorDelegate {
    func didUpdateOrientation(to orientation: SCNQuaternion)
    func didUpdateVerticalFieldOfView(to vfov: CGFloat)
}

class CameraNavigator {
    let gestureController: GestureController
    let viewSize: CGSize
    var verticalFieldOfView: CGFloat {
        didSet {
            delegate.didUpdateVerticalFieldOfView(to: verticalFieldOfView)
        }
    }
    var verticalFieldOfViewInRadian: CGFloat {
        get {
            return verticalFieldOfView * CGFloat.pi / 180.0
        }
        set(newVerticalFieldOfViewInRadian) {
            verticalFieldOfView = newVerticalFieldOfViewInRadian * 180.0 / CGFloat.pi
        }
    }
    var orientation: GLKQuaternion {
        didSet {
            delegate.didUpdateOrientation(to: SCNQuaternion(orientation))
        }
    }
    var delegate: CameraNavigatorDelegate
    var anglePerDistance: CGFloat {
        get {
            return verticalFieldOfViewInRadian / viewSize.height
        }
    }
    
    init(with view: UIView, initialOrientation: SCNQuaternion, verticalFieldOfView: CGFloat, delegate: CameraNavigatorDelegate) {
        gestureController = GestureController(with: view)
        viewSize = view.bounds.size
        orientation = GLKQuaternion(initialOrientation)
        self.verticalFieldOfView = verticalFieldOfView
        self.delegate = delegate
        gestureController.delegate = self
    }
    
    func setModeToGesture() {
        gestureController.enabled = true
    }
    
    func setModeToDeviceMotion(with initialOrientation: SCNQuaternion) {
        gestureController.enabled = false
        orientation = GLKQuaternion(initialOrientation)
    }
}

extension CameraNavigator: GestureDelegate {
    func didPan(by vector: CGVector) {
        let horizontalAngle = Float(vector.dx * anglePerDistance) * (-1.0)
        let verticalAngle = Float(vector.dy * anglePerDistance) * (-1.0)
        let horizontalRotation = GLKQuaternionMakeWithAngleAndAxis(horizontalAngle, 0, 1, 0)
        let verticalRotation = GLKQuaternionMakeWithAngleAndAxis(verticalAngle, 1, 0, 0)
        let totalRotation = GLKQuaternionMultiply(horizontalRotation, verticalRotation)
        orientation = GLKQuaternionMultiply(totalRotation, orientation)
    }
    
    func didRotate(by angle: CGFloat) {
        let rotationAngle = Float(angle) * (-1.0)
        let rotation = GLKQuaternionMakeWithAngleAndAxis(rotationAngle, 0, 0, 1)
        orientation = GLKQuaternionMultiply(rotation, orientation)
    }
    
    func didScale(by ratio: CGFloat) {
        verticalFieldOfViewInRadian /= ratio
    }
}



