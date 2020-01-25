//
//  CelestialNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import SceneKit

enum CelestialNode {
    static var Sphere: SphereNode {
        return SphereNode.shared
    }
    
    static var Camera: SCNNode {
        return CameraNode.createCameraNode()
    }
    
    static var Light: SCNNode {
        return LightNode.createLightNode()
    }
    
    static var Horizon: SCNNode {
        return HorizonNode.createHorizonNode()
    }
    
}
