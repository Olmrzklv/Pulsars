//
//  HorizonNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 1/1/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import SceneKit

final class HorizonNode: SCNNode {
    static func createHorizonNode() -> SCNNode {
        let geometry = SCNTorus(ringRadius: 9.90, pipeRadius: 0.01)
        geometry.firstMaterial?.diffuse.contents = UIColor.blue
        let horizonNode = SCNNode(geometry: geometry)
        horizonNode.position = SCNVector3Make(0, 0, 0)
        return horizonNode
    }
}

