//
//  PulsarNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import SceneKit

class PulsarNode: SCNNode {
    
    convenience init(with pulsar: Pulsar) {
        let pulsarGeometry = SCNSphere(radius: 0.05)
        pulsarGeometry.firstMaterial?.diffuse.contents = pulsar.color
        pulsarGeometry.firstMaterial?.isDoubleSided = true
        let pulsarNode = SCNNode(geometry: pulsarGeometry)
        pulsarNode.position = SCNVector3Make(pulsar.x, pulsar.y, pulsar.z)
        
        self.init()
    }

}
