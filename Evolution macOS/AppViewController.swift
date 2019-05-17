//
//  AppViewController.swift
//  Evolution macOS
//
//  Created by Martin Mlostek on 16.05.19.
//  Copyright © 2019 Nomad5. All rights reserved.
//

import Cocoa
import SceneKit

class AppViewController: NSViewController {

    var gameView: SCNView!

    var gameController: GameController!

    override func loadView() {
        self.view = NSView(frame: CGRect(x: 0, y: 0, width: 1000, height: 600))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameView = SCNView(frame: self.view.frame)
        self.view.addSubview(gameView)
        self.gameController = GameController(sceneRenderer: gameView)
        
        // Allow the user to manipulate the camera
        self.gameView.allowsCameraControl = true
        
        // Show statistics such as fps and timing information
        self.gameView.showsStatistics = true
        
        // Configure the view
        self.gameView.backgroundColor = NSColor.black
        
        // Add a click gesture recognizer
        let clickGesture = NSClickGestureRecognizer(target: self, action: #selector(handleClick(_:)))
        var gestureRecognizers = gameView.gestureRecognizers
        gestureRecognizers.insert(clickGesture, at: 0)
        self.gameView.gestureRecognizers = gestureRecognizers
    }
    
    @objc
    func handleClick(_ gestureRecognizer: NSGestureRecognizer) {
        // Highlight the clicked nodes
        let p = gestureRecognizer.location(in: gameView)
        gameController.highlightNodes(atPoint: p)
    }
    
}
