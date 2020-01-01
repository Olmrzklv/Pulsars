//
//  LightNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 1/1/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import SceneKit

final class LightNode: SCNNode {
    static func createLightNode() -> SCNNode {
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .ambient
        lightNode.light?.color = UIColor.white
        return lightNode
    }
}
