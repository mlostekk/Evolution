//  Copyright © 2019 Nomad5. All rights reserved.

import Cocoa

/// The main view controller
class AppViewController: NSViewController {

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

    /// Provide main view
    override func loadView() {
        self.view = NSView(frame: CGRect(x: 0, y: 0, width: 1000, height: 600))
    }

    /// View was loaded
    override func viewDidLoad() {
        super.viewDidLoad()

        // create main render view
        let v = mainController.initializeWith(size: self.view.frame.size)
        self.view.addSubview(v)

        // Add a click gesture recognizer
        let clickGesture       = NSClickGestureRecognizer(target: self, action: #selector(handleClick(_:)))
        var gestureRecognizers = v.gestureRecognizers
        gestureRecognizers.insert(clickGesture, at: 0)
        v.gestureRecognizers = gestureRecognizers

    }

    /// Handle click
    @objc
    func handleClick(_ gestureRecognizer: NSGestureRecognizer) {
        // Highlight the clicked nodes
        let v = mainController.getView()
        let p = gestureRecognizer.location(in: v)
        mainController.highlightNodes(atPoint: p)

    }

}
