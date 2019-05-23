// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import CoreGraphics

/// Root view controller protocol
/// Used by platform agnostic view controllers
/// to instantiate, render and interact.
protocol AppController {

    /// Create the main view that should be attached
    func initialize(with size: CGSize) -> XView

    /// Forward a click
    func handleClick(atPoint point: CGPoint)

}

/// Main implementation of the root controller
class MainAppController: AppController {

    /// The global assembler
    let mainView: RootView

    /// The world
    let world:    World

    /// Constructor with dependencies
    init(rootView: RootView, world: World) {
        self.mainView = rootView
        self.world = world
    }

    /// The main initialization. Returns the main view
    func initialize(with size: CGSize) -> XView {
        return mainView.initialize(with: size)
    }

    /// Main point to handle / forward clicks
    func handleClick(atPoint point: CGPoint) {
        world.reset()
        mainView.handleClick(atPoint: point)
    }
}