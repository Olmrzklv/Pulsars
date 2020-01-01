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
        let pulsarName = SCNText(string: pulsar.name, extrusionDepth: 0.0001)
        pulsarName.font = UIFont(name: "Helvetica", size: 0.003)
        pulsarName.firstMaterial?.diffuse.contents = UIColor.white
        pulsarName.firstMaterial?.isDoubleSided = true
        
        let textNode = SCNNode(geometry: pulsarName)
        textNode.scale = SCNVector3Make(0.01, 0.01, 0.01)
        textNode.position = SCNVector3Make(pulsar.x*0.9, pulsar.y*0.9, pulsar.z*0.9)
        
        self.init()
    }
    
}

// TO BE DELETED after PULSAR DATASOURCE
class Pulsar {
    var name: String = ""
    var x: Float = 0.0
    var y: Float = 0.0
    var z: Float = 0.0
    var color = UIColor.white
}
