//
//  PulsarViewController.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import UIKit
import SceneKit

class PulsarViewController: UIViewController {

    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        let celestialScene = CelestialScene(sphere:CelestialNode.Sphere,
                                            camera: CelestialNode.Camera,
                                            circles: CelestialNode.CelestialCircles)

        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = .black
        sceneView.scene = celestialScene
        sceneView.pointOfView = celestialScene.cameraNode
    }

}

extension PulsarViewController: SCNSceneRendererDelegate {
    
}
