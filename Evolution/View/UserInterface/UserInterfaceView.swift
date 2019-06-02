// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// The user interface view
protocol UserInterfaceView {

    /// Create and attach to the given view
    func initialize(within view: XView)

}