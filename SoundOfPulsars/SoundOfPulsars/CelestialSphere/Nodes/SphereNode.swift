//
//  SphereNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import SceneKit

final class SphereNode: SCNNode {
    static func createCelestialSphereNode() -> SCNNode {
        let celestialSphereNode = SCNNode()
        celestialSphereNode.geometry = SCNSphere(radius: 10)
        celestialSphereNode.geometry?.firstMaterial?.isDoubleSided = true
        celestialSphereNode.geometry?.firstMaterial?.diffuse.contents = UIImage.starMap
        celestialSphereNode.position = SCNVector3Make(0, 0, 0)
        return celestialSphereNode
    }
}

