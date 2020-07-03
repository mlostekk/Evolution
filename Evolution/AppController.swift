// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import CoreGraphics
import UIKit

/// Root view controller protocol
/// Used by platform agnostic view controllers
/// to instantiate, render and interact.
protocol AppController {

    /// Create the main view that should be attached
    func initialize(within parent: UIView) -> UIView

    /// Forward a click
    func handleClick(atPoint point: CGPoint)

}

/// Main implementation of the root controller
class MainAppController: AppController {

    /// The global assembler
    let mainView: WorldView

    /// The user interface view
    let uiView:   UserInterfaceView

    /// The world
    let world:    World

    /// Constructor with dependencies
    init(rootView: WorldView, uiView: UserInterfaceView, world: World) {
        self.mainView = rootView
        self.uiView = uiView
        self.world = world
    }

    /// The main initialization. Returns the main view
    func initialize(within parent: UIView) -> UIView  {
        let view = mainView.initialize(within: parent)
        uiView.initialize(within: view)
        return view
    }

    /// Main point to handle / forward clicks
    func handleClick(atPoint point: CGPoint) {
        world.reset()
        mainView.handleClick(atPoint: point)
    }
}
