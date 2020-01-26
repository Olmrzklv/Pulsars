//
//  GLKQuaternion+initWithCMQuaternion.swift
//  CameraNavigator
//
//  Created by Onur Ornek on 1/26/20.
//  Copyright © 2020 Onur Ornek. All rights reserved.
//

import Foundation
import CoreMotion
import GLKit

extension GLKQuaternion {
    init(_ cmQuaternion: CMQuaternion) {
        self = GLKQuaternionMake(Float(cmQuaternion.x), Float(cmQuaternion.y), Float(cmQuaternion.z), Float(cmQuaternion.w))
    }
}
