// Copyright (c) 2019 Nomad5. All rights reserved.

import UIKit

/// The main root view assembler
protocol ViewAssembler {

    func resolve() -> RootView
}

/// Root view protocol
protocol RootView {

    /// get view
    func initialize(with size: CGSize) -> UIView

    /// click
    func handleClick(atPoint point: CGPoint)

}

/// The user interface view
protocol UserInterfaceView {

    /// Create and attach to the given view
    func initialize(within view: UIView)

}
