// Copyright (c) 2019 Nomad5. All rights reserved.

import UIKit
import RxSwift

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

    /// Step button tap observable
    var stepButtonStream:     Observable<Void> { get }

    /// Step button tap observable
    var resetButtonStream:    Observable<Void> { get }

    /// Step button tap observable
    var settingsButtonStream: Observable<Void> { get }
}