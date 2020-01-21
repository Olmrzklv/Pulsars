//
//  HorizonNode.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import SceneKit

///Describes Parallels, The Equator, Meridians, and Horizon Nodes
final class CelestialCirclesNode: SCNNode {
    static let shared = CelestialCirclesNode()
    
    private var paralelsNode: SCNNode!
    private var meridiansNode: SCNNode!
    
    private override init() {
        super.init()
        paralelsNode = createParalels()
        meridiansNode = createMeridians()
        showMeridiansAndParalels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hideMeridiansAndParalels() {
        meridiansNode.removeFromParentNode()
        paralelsNode.removeFromParentNode()
    }
    
    func showMeridiansAndParalels() {
        self.addChildNode(meridiansNode)
        self.addChildNode(paralelsNode)
    }
    
}


extension CelestialCirclesNode {
    
    private func createParalels() -> SCNNode {
        let paralels = SCNNode()
        for i in -9 ..< 10 {
            let paralelNode = SCNNode()
            let radius = CGFloat(9.90 * cos( CGFloat(i) * CGFloat(Double.pi) / 18))
            let geometry = SCNTorus(ringRadius: radius, pipeRadius: 0.01)
            let alpha: CGFloat = (i == 0) ? 1.0 : 0.25
            geometry.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(alpha)
            paralelNode.geometry = geometry
            let yPosition = Float(9.90 *  sin( CGFloat(i) * CGFloat(Double.pi) / 18))
            paralelNode.position = SCNVector3Make(0, yPosition, 0)
            paralels.addChildNode(paralelNode)
        }
        return paralels
    }
    
    private func createMeridians() -> SCNNode {
        let meridians = SCNNode()
        for i in 0 ..< 24 {
            let geometry = SCNTorus(ringRadius: 9.90, pipeRadius: 0.01)
            geometry.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.3)
            let meridianNode = SCNNode(geometry: geometry)
            meridianNode.position = SCNVector3Make(0, 0, 0)
            
            let xPosition = cos(Float(i) * Float(Double.pi) / Float(12))
            let zPosition = sin(Float(i) * Float(Double.pi)/12)
            meridianNode.rotation = SCNVector4Make(xPosition, 0, zPosition, Float(Double.pi / 2))
            meridians.addChildNode(meridianNode)
        }
        return meridians
    }
}
