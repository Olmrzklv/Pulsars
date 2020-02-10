//
//  DeviceMotionController.swift
//  CameraNavigator
//
//  Created by Onur Ornek on 1/20/20.
//  Copyright © 2020 Onur Ornek. All rights reserved.
//

import Foundation
import CoreMotion
import SceneKit

protocol DevicoMotionDelegate {
    func didUpdateAttitude(to quaternion: GLKQuaternion)
}

class DeviceMotionController {
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    var delegate: DevicoMotionDelegate?
    var attitude = CMQuaternion(x: 0, y: 0, z: 0, w: 1) {
        didSet {
            if let dmDelegate = self.delegate {
                dmDelegate.didUpdateAttitude(to: GLKQuaternion(self.attitude))
            }
        }
    }
    var enabled = false {
        didSet {
            if (motionManager.isDeviceMotionAvailable) {
                if (self.enabled && !motionManager.isDeviceMotionActive) {
                    motionManager.startDeviceMotionUpdates(
                    using: CMAttitudeReferenceFrame.xTrueNorthZVertical,
                    to: self.queue) { (deviceMotion, error) in
                        if let motion = deviceMotion {
                            self.attitude = motion.attitude.quaternion
                        }
                    }
                } else if (!self.enabled && motionManager.isDeviceMotionActive) {
                    motionManager.stopDeviceMotionUpdates()
                }
            }
        }
    }
    
    static func handler(deviceMotion: CMDeviceMotion?, error: Error?) {
        
    }
    
    init() {
        motionManager.deviceMotionUpdateInterval = TimeInterval(floatLiteral: 0.01)
    }
    
}
