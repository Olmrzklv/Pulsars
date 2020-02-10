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
import PulsarDatasource

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
       // guard let pointOfView = sceneView.pointOfView else { return }
        sphereNode.pulsarsNode.childNodes.forEach {
            guard let pulsarNode = $0 as? PulsarNode else {return}
            pulsarNode.amplitude = Double(getAmplitude(for: pulsarNode.pulsar))
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

extension PulsarViewController {
    func getAmplitude(for pulsar: Pulsar) -> Float {
        let direction = cameraNode.direction
        let product = GLKVector3DotProduct(direction, GLKVector3Make(pulsar.x, pulsar.y, pulsar.z))
        let angleBetweenPulsarAndCenter:Float = acos(product / Pulsar.R)
        let angleInDegrees:Float = (angleBetweenPulsarAndCenter * 180) / Float.pi
        
        guard let fieldOfView = cameraNode.camera?.fieldOfView else { return 0.0 }
        let fOV: Float = Float(fieldOfView)
        let amplitude:Float = 4 * (1/4 - (angleInDegrees / fOV))
        return amplitude > 0 ? (amplitude * 10) : 0.0
    }
}
