// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import CoreGraphics

/// Root view controller protocol
protocol RootViewProtocol {

    /// get view
    func initializeWith(size: CGSize) -> XView

    /// get view
    func getView() -> XView

    /// click
    func highlightNodes(atPoint point: CGPoint)

}