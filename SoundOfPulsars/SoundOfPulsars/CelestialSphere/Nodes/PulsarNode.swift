//
//  PulsarNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import SceneKit
import PulsarDatasource

final class PulsarNode: SCNNode {
    
    convenience init(with pulsar: Pulsar) {
        self.init()

        geometry = SCNSphere(radius: 0.05)
        geometry?.firstMaterial?.diffuse.contents = pulsar.color
        geometry?.firstMaterial?.isDoubleSided = true
        position = SCNVector3Make(pulsar.x, pulsar.y, pulsar.z)
        
    }
    
    private override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
