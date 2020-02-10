//
//  CameraNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import SceneKit
import CameraNavigator

final class CameraNode: SCNNode {
    var direction: GLKVector3 {
        get {
            let glkOrientation = GLKQuaternion(orientation)
            var product = GLKQuaternionMultiply(GLKQuaternionInvert(glkOrientation), GLKQuaternionMake(0, 0, -1, 0))
            product = GLKQuaternionMultiply(product, glkOrientation)
            return GLKVector3Make(product.x, product.y, product.z)
        }
    }

    override init()  {
        super.init()
        camera = SCNCamera()
        position = SCNVector3Make(0, 0, 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
