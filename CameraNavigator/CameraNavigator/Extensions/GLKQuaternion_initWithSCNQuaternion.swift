//
//  GLKQuaternion_initWithSCNQuaternion.swift
//  CameraNavigator
//
//  Created by Onur Ornek on 1/19/20.
//  Copyright © 2020 Onur Ornek. All rights reserved.
//

import Foundation
import SceneKit

extension GLKQuaternion {
    init(_ scnQuaternion: SCNQuaternion) {
        self = GLKQuaternionMake(scnQuaternion.x, scnQuaternion.y, scnQuaternion.z, scnQuaternion.w)
    }
}
