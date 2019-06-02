// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// Main world view interface
protocol WorldView {

    /// get view
    func initialize(with size: CGSize) -> XView

    /// click
    func handleClick(atPoint point: CGPoint)

}
