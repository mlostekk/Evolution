// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// The main root view assembler
protocol ViewAssembler {

    func resolve() -> RootView
}

/// Root view protocol
protocol RootView {

    /// get view
    func initialize(with size: CGSize) -> XView

    /// click
    func handleClick(atPoint point: CGPoint)

}