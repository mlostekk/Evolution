//
//  GameController.swift
//  Evolution Shared
//
//  Created by Martin Mlostek on 16.05.19.
//  Copyright © 2019 Nomad5. All rights reserved.
//

import SceneKit


class GameController: NSObject, MainViewProtocol, SCNSceneRendererDelegate {

    var view:  SCNView
    var scene: SCNScene?

    override init() {
        self.view = SCNView(frame: .zero)
        super.init()
    }

    /// Create the view
    func initializeWith(size: CGSize) -> XView {
        view.frame = CGRect(origin: .zero, size: size)
        scene = SCNScene(named: "Assets.scnassets/MainScene.scn")!


        // Allow the user to manipulate the camera
        view.allowsCameraControl = true

        // Show statistics such as fps and timing information
        view.showsStatistics = true

        view.delegate = self

//        if let ship = scene.rootNode.childNode(withName: "ship", recursively: true) {
//            ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
//        }

        view.scene = scene
        return view
    }

    func getView() -> XView {
        return view
    }

    /// Handle click
    func highlightNodes(atPoint point: CGPoint) {
        let hitResults = self.view.hitTest(point, options: [:])
        for result in hitResults {
            // get its material
            guard let material = result.node.geometry?.firstMaterial else {
                return
            }

            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5

            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5

                material.emission.contents = XColor.black

                SCNTransaction.commit()
            }

            material.emission.contents = XColor.red

            SCNTransaction.commit()
        }
    }

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        // Called before each frame is rendered
    }
}
