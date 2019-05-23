//  Copyright © 2019 Nomad5. All rights reserved.

import Cocoa

/// The main view controller
class AppViewController: NSViewController {

    /// The main controller
    var rootController: AppController

    /// The main root view (implicitly unwrapped 
    /// because created inside viewDidLoad)
    var rootView:       NSView!
    
    /// Required init
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

    /// Construct with dependencies
    init(assembler: Assembler) {
        self.rootController = assembler.resolve()
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
        rootView = rootController.initialize(with: self.view.frame.size)
        self.view.addSubview(rootView)

        // Add a click gesture recognizer
        let clickGesture       = NSClickGestureRecognizer(target: self, action: #selector(handleClick(_:)))
        var gestureRecognizers = rootView.gestureRecognizers
        gestureRecognizers.insert(clickGesture, at: 0)
        rootView.gestureRecognizers = gestureRecognizers

    }

    /// Handle click
    @objc
    func handleClick(_ gestureRecognizer: NSGestureRecognizer) {
        // Highlight the clicked nodes
        let point = gestureRecognizer.location(in: rootView)
        rootController.handleClick(atPoint: point)

    }

}
