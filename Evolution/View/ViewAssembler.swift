// Copyright (c) 2019 Nomad5. All rights reserved.

import UIKit

/// The interface for rendering
protocol ViewAssembler {

    /// Get the renderer
    func resolve() -> RenderView

    /// Get the controls view
    func resolve() -> ControlsView
}

/// The interface for rendering
protocol RenderView: UIViewController {

}

/// The interface for the controls
protocol ControlsView: UIViewController {

}