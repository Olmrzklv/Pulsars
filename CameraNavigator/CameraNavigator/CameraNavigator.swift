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

///Any class who wants to be notified by the CameraNavigator must conform to this protocol.
public protocol CameraNavigatorDelegate {
    func didUpdateOrientation(to orientation: SCNQuaternion)
    func didUpdateVerticalFieldOfView(to vfov: CGFloat)
}

/** CameraNavigator is a class that handles gestures and device motion
 to keep track of an orientation and a zoom factor. The orientation and
 the zoom factor are designed to belong to a camera.
    - orientation is in the form of a quaternion
    - zoom factor is expressed in terms of vertical field of view,
 which represents the angle of sight (in degrees) between the bottom
 and the top of a view. */
public class CameraNavigator {
    let gestureController: GestureController
    let deviceMotionController = DeviceMotionController()
    let viewSize: CGSize
    var verticalFieldOfView: CGFloat {
        didSet {
            if let navigatorDelegate = delegate {
                navigatorDelegate.didUpdateVerticalFieldOfView(to: verticalFieldOfView)
            }
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
            if let navigatorDelegate = delegate {
                navigatorDelegate.didUpdateOrientation(to: SCNQuaternion(orientation))
            }
        }
    }
    private var attitudeToOrientationConverter: GLKQuaternion?
    var deviceAttitude: GLKQuaternion? {
        didSet {
            if let attitude = deviceAttitude, let converter = attitudeToOrientationConverter {
                    orientation = GLKQuaternionMultiply(converter, attitude)
            }
        }
    }
    
    var initialOrientation: GLKQuaternion?
    
    public var delegate: CameraNavigatorDelegate?
    var anglePerDistance: CGFloat {
        get {
            return verticalFieldOfViewInRadian / viewSize.height
        }
    }
    
    fileprivate static let maxFieldOfViewInRadian = CGFloat(2)
    fileprivate static let minFieldOfViewInRadian = CGFloat(0.1)
    
    public init(with view: UIView, initialOrientation: SCNQuaternion, verticalFieldOfView: CGFloat) {
        gestureController = GestureController(with: view)
        viewSize = view.bounds.size
        orientation = GLKQuaternion(initialOrientation)
        self.verticalFieldOfView = verticalFieldOfView
        gestureController.delegate = self
        deviceMotionController.delegate = self
    }
    
    /** To be called to use pan and rotation gestures to navigate the orientation.
        Zoom is always controlled by the pinch gesture. */
    public func setModeToGesture() {
        gestureController.enabled = true
        deviceMotionController.enabled = false
        deviceAttitude = nil
        attitudeToOrientationConverter = nil
        initialOrientation = nil
    }
    
    /** To be called to use device motion to navigate the orientation.
        Zoom is always controlled by the pinch gesture. */
    public func setModeToDeviceMotion(with initialOrientation: SCNQuaternion) {
        self.initialOrientation = GLKQuaternion(initialOrientation)
        deviceMotionController.enabled = true
        gestureController.enabled = false
    }
}

extension CameraNavigator: GestureDelegate {
    func didPan(by vector: CGVector) {
        let horizontalAngle = Float(vector.dx * anglePerDistance)
        let verticalAngle = Float(vector.dy * anglePerDistance)
        let horizontalRotation = GLKQuaternionMakeWithAngleAndAxis(horizontalAngle, 0, 1, 0)
        let verticalRotation = GLKQuaternionMakeWithAngleAndAxis(verticalAngle, 1, 0, 0)
        let totalRotation = GLKQuaternionMultiply(horizontalRotation, verticalRotation)
        orientation = GLKQuaternionMultiply(orientation, totalRotation)
    }
    
    func didRotate(by angle: CGFloat) {
        let rotationAngle = Float(angle)
        let rotation = GLKQuaternionMakeWithAngleAndAxis(rotationAngle, 0, 0, 1)
        orientation = GLKQuaternionMultiply(orientation, rotation)
    }
    
    func didScale(by ratio: CGFloat) {
        let newFieldOfView = verticalFieldOfViewInRadian / ratio
        if (newFieldOfView > CameraNavigator.maxFieldOfViewInRadian) {
            verticalFieldOfViewInRadian = CameraNavigator.maxFieldOfViewInRadian
        } else if (newFieldOfView < CameraNavigator.minFieldOfViewInRadian) {
            verticalFieldOfViewInRadian = CameraNavigator.minFieldOfViewInRadian
        } else {
            verticalFieldOfViewInRadian = newFieldOfView
        }
    }
}

extension CameraNavigator: DevicoMotionDelegate {
    func didUpdateAttitude(to quaternion: GLKQuaternion) {
        if (deviceAttitude == nil), let orientation = initialOrientation {
            attitudeToOrientationConverter = GLKQuaternionMultiply(orientation, GLKQuaternionInvert(quaternion))
        }
        deviceAttitude = quaternion
    }
}



