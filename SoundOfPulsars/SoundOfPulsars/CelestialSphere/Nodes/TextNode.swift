//
//  TextNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import SceneKit
import PulsarDatasource

final class TextNode: SCNNode {
    
    convenience init(with pulsar: Pulsar) {
        self.init()
        
        let pulsarName = SCNText(string: pulsar.name, extrusionDepth: 0.0001)
        pulsarName.font = UIFont(name: "Helvetica", size: 12)
        geometry = pulsarName
        geometry?.firstMaterial?.diffuse.contents = UIColor.white
        geometry?.firstMaterial?.isDoubleSided = true
        
        scale = SCNVector3Make(0.01, 0.01, 0.01)
        position = SCNVector3Make(pulsar.x*0.9, pulsar.y*0.9, pulsar.z*0.9)
    }
    
    private override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
