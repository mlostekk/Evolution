// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import UIKit

/// The user interface view
protocol UserInterfaceView {

    /// Create and attach to the given view
    func initialize(within view: UIView)

}
