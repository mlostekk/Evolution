// Copyright (c) 2019 Nomad5. All rights reserved.

import UIKit
import RxSwift

/// The interface for rendering
protocol RenderView: UIViewController {

    /// Construct with dependencies
    init(world: World)

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