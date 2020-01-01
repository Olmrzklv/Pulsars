//
//  SphereNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import SceneKit

final class SphereNode: SCNNode {
    
    static func createCelestialSphere() -> SCNNode {
        let sphere = SCNSphere(radius: 10)
        sphere.firstMaterial?.diffuse.contents = UIImage.starMap
        sphere.firstMaterial?.isDoubleSided = true
        let celestialSphereNode = SCNNode(geometry: sphere)
        celestialSphereNode.position = SCNVector3Make(0, 0, 0)
        celestialSphereNode.physicsBody = SCNPhysicsBody.kinematic()
        return celestialSphereNode
    }
    
}

