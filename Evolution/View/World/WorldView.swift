// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import UIKit

/// Main world view interface
protocol WorldView {

    /// get view
    func initialize(within parent: UIView) -> UIView

    /// click
    func handleClick(atPoint point: CGPoint)

}
