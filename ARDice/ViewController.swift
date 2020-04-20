//
//  ViewController.swift
//  ARDice
//
//  Created by Veldanov, Anton on 4/19/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
  
  @IBOutlet var sceneView: ARSCNView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    //    self.sceneView.debugOptions = [ARSCNDebugOptions.showConstraints]
    
    
    // Set the view's delegate
    sceneView.delegate = self
    // units in meters
    
    
    //    //MARK: - Sphere - MOON
    //    let sphere = SCNSphere(radius: 0.2)
    //    let materialSphere = SCNMaterial()
    //    materialSphere.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
    //    sphere.materials = [materialSphere]
    //    let nodeSphere = SCNNode()
    //    nodeSphere.position = SCNVector3(0.3,0.3,-0.5)
    //    nodeSphere.geometry = sphere
    //    sceneView.scene.rootNode.addChildNode(nodeSphere)
    
    
    
    //    //MARK: - CUBE
    //    let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
    //    let material = SCNMaterial()
    //    material.diffuse.contents = UIColor.systemPink
    //    cube.materials  = [material]
    //    let node = SCNNode()
    //    node.position = SCNVector3(0, 0.1, -0.5)
    //    node.geometry = cube
    //
    //    sceneView.scene.rootNode.addChildNode(node)
    
    sceneView.autoenablesDefaultLighting =  true
    // Create a new scene
    let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
    
    if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true){
      diceNode.position = SCNVector3(0, 0, -0.1)
      sceneView.scene.rootNode.addChildNode(diceNode)
      
    }
    
    
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    
    
    // Create a session configuration
    let configuration = ARWorldTrackingConfiguration()
    
    
    configuration.planeDetection = .horizontal
    
    
    
    // Run the view's session
    sceneView.session.run(configuration)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    
    // Pause the view's session
    sceneView.session.pause()

  }
  
  
  
  func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
    if anchor is ARPlaneAnchor{
      
      let planeAnchor = anchor as! ARPlaneAnchor
      
//      print("Plane detected!")
    }else{
      print("Shit")
      return
    }
  }
  
  
  
  
  
  // MARK: - ARSCNViewDelegate
  
  /*
   // Override to create and configure nodes for anchors added to the view's session.
   func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
   let node = SCNNode()
   
   return node
   }
   */
  
  func session(_ session: ARSession, didFailWithError error: Error) {
    // Present an error message to the user
    
  }
  
  func sessionWasInterrupted(_ session: ARSession) {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
  }
  
  func sessionInterruptionEnded(_ session: ARSession) {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
  }
}
