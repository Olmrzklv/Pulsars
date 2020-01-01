//
//  CameraNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import SceneKit

final class CameraNode: SCNNode {
    
    static func createCameraNode() -> SCNNode {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 0)
        cameraNode.physicsBody = SCNPhysicsBody.kinematic()
        return cameraNode
    }
    
}
