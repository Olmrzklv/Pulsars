//
//  CelestialNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import SceneKit

enum CelestialNode {
    static var Sphere: SCNNode {
        return SphereNode.createCelestialSphere()
    }
    
    static var Camera: SCNNode {
        return CameraNode.createCameraNode()
    }
}
