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
    
    private var paralelsNode: SCNNode!
    private var meridiansNode: SCNNode!
    
    func createCelestialCirclesNode() {
        paralelsNode = createParalels()
        meridiansNode = createMeridians()
        showMeridiansAndParalels()
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
    
    fileprivate func createParalels() -> SCNNode {
        let paralels = SCNNode()
        for i in -10 ..< 10 {
            let paralelNode = SCNNode()
            let radius = CGFloat(9.90 * cos( CGFloat(i) * CGFloat(Double.pi) / 18))
            let geometry = SCNTorus(ringRadius: radius, pipeRadius: 0.01)
            geometry.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.3)
            paralelNode.geometry = geometry
            let yPosition = Float(9.90 *  sin( CGFloat(i) * CGFloat(Double.pi) / 18))
            paralelNode.position = SCNVector3Make(0, yPosition, 0)
            paralels.addChildNode(paralelNode)
        }
        return paralels
    }
    
    fileprivate func createMeridians() -> SCNNode {
        let meridians = SCNNode()
        for i in 0 ..< 25 {
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
