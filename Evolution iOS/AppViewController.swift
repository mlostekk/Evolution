//  Copyright © 2019 Nomad5. All rights reserved.

import UIKit

/// The main app view controller
class AppViewController: UIViewController {

    /// The main controller
    var mainController: RootViewProtocol

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

    /// View is ready to be filled with sizing relevant stuff
    override func viewDidLoad() {
        super.viewDidLoad()

        // create main render view
        let mainView = mainController.initializeWith(size: self.view.frame.size)
        self.view.addSubview(mainView)

        // Add a tap gesture recognizer
        let tapGesture         = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        var gestureRecognizers = mainView.gestureRecognizers ?? []
        gestureRecognizers.insert(tapGesture, at: 0)
        mainView.gestureRecognizers = gestureRecognizers
    }

    /// Handle tap
    @objc func handleTap(_ gestureRecognizer: UIGestureRecognizer) {
        // Highlight the clicked nodes
        let mainView = mainController.getView()
        let point    = gestureRecognizer.location(in: mainView)
        mainController.highlightNodes(atPoint: point)
    }

    /// Fullscreen
    override var prefersStatusBarHidden:         Bool {
        return true
    }

    /// Should automatically rotate
    override var shouldAutorotate:               Bool {
        return true
    }

    /// Orientation locks
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

}
