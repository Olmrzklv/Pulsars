//
//  SCNQuaternion+initWithGLKQuaternion.swift
//  CameraNavigator
//
//  Created by Onur Ornek on 1/19/20.
//  Copyright © 2020 Onur Ornek. All rights reserved.
//

import Foundation
import SceneKit

extension SCNQuaternion {
    init(_ glkQuaternion: GLKQuaternion) {
        self.init(x: glkQuaternion.x, y: glkQuaternion.y, z: glkQuaternion.z, w: glkQuaternion.w)
    }
}
