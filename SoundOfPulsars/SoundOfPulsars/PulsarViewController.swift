//
//  PulsarViewController.swift
//  SoundOfPulsars
//
//  Created by EsmaGO on 12/22/19.
//  Copyright © 2019 EsmaGO. All rights reserved.
//

import UIKit
import SceneKit
import CameraNavigator

class PulsarViewController: UIViewController {

    @IBOutlet weak var sceneView: SCNView!
    private let cameraNode = CelestialNode.Camera
    private let sphereNode = CelestialNode.Sphere
    private lazy var zoomAmount:CGFloat = 60.0
    private var orientation = SCNQuaternion(0, 0, 0, 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        let celestialScene = CelestialScene(sphere: sphereNode,
                                            camera: cameraNode)

        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = .black
        sceneView.scene = celestialScene
        sceneView.pointOfView = celestialScene.cameraNode
        
        guard let fOV = cameraNode.camera?.fieldOfView else { return }
        let cameraNavigator = CameraNavigator(with: self.view,
                                              initialOrientation: orientation,
                                              verticalFieldOfView: fOV)
        cameraNavigator.delegate = self
        cameraNavigator.setModeToGesture()
    }

}

extension PulsarViewController: SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        sphereNode.textsNode.childNodes.forEach {
            $0.orientation = cameraNode.orientation
        }
        guard let pointOfView = sceneView.pointOfView else { return }
        sphereNode.pulsarsNode.childNodes.forEach {
            guard let pulsarNode = $0 as? PulsarNode else {return}
            if  sceneView.isNode($0, insideFrustumOf: pointOfView) {
                pulsarNode.addGlow()
            }else {
                pulsarNode.removeGlow()
            }

        }
    }
}

extension PulsarViewController: CameraNavigatorDelegate {
    func didUpdateOrientation(to orientation: SCNQuaternion) {
        cameraNode.orientation = orientation
    }
    
    func didUpdateVerticalFieldOfView(to vfov: CGFloat) {
        cameraNode.camera?.fieldOfView = vfov
    }
    
    
}
