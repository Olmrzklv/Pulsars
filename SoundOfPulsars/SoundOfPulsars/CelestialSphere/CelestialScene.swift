//
//  CelestialScene.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import UIKit
import SceneKit

/* Celestial Scene Tree Structure:
                CelestialScene.rootNode
                /                      \
            CAMERA NODE            SPHERE NODE
                                 /     |       \
                                /      |        \
                        PULSAR NODE TEXT NODE  CIRCLE NODE
                                             /     |    \
                                            /      |     \
                                      Paralel   Meridian  Horizon
 
 */
final class CelestialScene: SCNScene {
    
    var cameraNode: SCNNode!
    var sphereNode: SCNNode!
        
    convenience init(sphere: SCNNode, camera: SCNNode) {
        self.init()
        
        self.cameraNode = camera
        self.sphereNode = sphere
    }
    
    func setup() {
        self.rootNode.addChildNode(sphereNode)
        self.rootNode.addChildNode(cameraNode)
    }
    
    
}
