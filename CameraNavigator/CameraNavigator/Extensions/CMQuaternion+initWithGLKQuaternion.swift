//
//  CMQuaternion+initWithGLKQuaternion.swift
//  CameraNavigator
//
//  Created by Onur Ornek on 1/26/20.
//  Copyright © 2020 Onur Ornek. All rights reserved.
//

import Foundation
import CoreMotion
import GLKit

extension CMQuaternion {
    init(_ glkQuaternion: GLKQuaternion) {
        self.init(x: Double(glkQuaternion.x), y: Double(glkQuaternion.y), z: Double(glkQuaternion.z), w: Double(glkQuaternion.w))
    }
}
