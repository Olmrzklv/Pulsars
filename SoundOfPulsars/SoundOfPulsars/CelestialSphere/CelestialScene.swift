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
                C E L E S T I A L  S C E N E'S  R O O T  N O D E
                /                 |            \              \
            CAMERA NODE      SPHERE NODE       LIGHT NODE   HORIZON
                           /     |       \
                          /      |        \
                PULSAR NODE TEXT NODE  CIRCLE NODE
                                        /     \
                                       /       \
                                   PARALEL   MERIDIAN
 
 */

final class CelestialScene: SCNScene {
    
    var cameraNode: CameraNode!
    var sphereNode: SphereNode!
        
    convenience init(sphere: SphereNode, camera: CameraNode) {
        self.init()
        self.cameraNode = camera
        self.sphereNode = sphere
        self.setupNodes()
    }
    
    func setupNodes() {
        self.rootNode.addChildNode(sphereNode)
        self.rootNode.addChildNode(cameraNode)
        self.rootNode.addChildNode(CelestialNode.Light)
        self.rootNode.addChildNode(CelestialNode.Horizon)
    }

}
