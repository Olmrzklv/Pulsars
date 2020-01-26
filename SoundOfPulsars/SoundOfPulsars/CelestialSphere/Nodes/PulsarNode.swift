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
    
    private var pulsar: Pulsar!
    private var glowNode = SCNNode()
    
    convenience init(with pulsar: Pulsar) {
        self.init()
        
        self.pulsar = pulsar
        geometry = SCNSphere(radius: 0.05)
        geometry?.firstMaterial?.diffuse.contents = pulsar.color
        geometry?.firstMaterial?.isDoubleSided = true
        position = SCNVector3Make(pulsar.x, pulsar.y, pulsar.z)
        
        setupGlowNode()
    }
    
    private override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PulsarNode {
    private func setupGlowNode() {
        glowNode.geometry = SCNSphere(radius: 0.05)
        glowNode.geometry?.firstMaterial?.diffuse.contents = pulsar.color.withAlphaComponent(0.2)
        glowNode.geometry?.firstMaterial?.isDoubleSided = true
        glowNode.position = SCNVector3Make(0, 0, 0)
        self.addChildNode(glowNode)

        let animation = CABasicAnimation(keyPath: "geometry.radius")
        animation.fromValue = 0.03
        animation.toValue = 0.5
        animation.duration = 0.2
        animation.autoreverses = true
        animation.repeatCount = .infinity
        glowNode.addAnimation(animation, forKey: "radius")
    }
    
    func addGlow() {
        addChildNode(glowNode)
    }
    
    func removeGlow() {
        glowNode.removeFromParentNode()
    }
}
