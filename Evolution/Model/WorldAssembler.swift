// Copyright (c) 2019 Nomad5. All rights reserved.

import UIKit

/// The interface for the world simulation
protocol WorldAssembler {

    /// Get the renderer
    func resolve() -> World
}

