//
//  AppViewController.swift
//  Evolution iOS
//
//  Created by Martin Mlostek on 16.05.19.
//  Copyright © 2019 Nomad5. All rights reserved.
//

import UIKit
import SceneKit

class AppViewController: UIViewController {

    /// The main controller
    var mainController: MainViewProtocol

    /// The main assembler
    let assembler:      Assembler

    /// Required init
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

    /// Construct with dependencies
    init(assembler: Assembler) {
        self.assembler = assembler
        self.mainController = assembler.resolve()
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // create main render view
        let v = mainController.initializeWith(size: self.view.frame.size)
        self.view.addSubview(v)

        // Add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        var gestureRecognizers = v.gestureRecognizers ?? []
        gestureRecognizers.insert(tapGesture, at: 0)
        v.gestureRecognizers = gestureRecognizers
    }

    @objc
    func handleTap(_ gestureRecognizer: UIGestureRecognizer) {
        // Highlight the clicked nodes
        let v = mainController.getView()
        let p = gestureRecognizer.location(in: v)
        mainController.highlightNodes(atPoint: p)

    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
