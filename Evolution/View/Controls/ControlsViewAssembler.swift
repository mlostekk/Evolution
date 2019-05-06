// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// The SceneKit specific assembler
protocol SimpleControlsViewAssembler: ViewAssembler {

    func resolve() -> ControlsView
}


/// Implementation of the SceneKit specific assembler
extension SimpleControlsViewAssembler where Self: Assembler {

    func resolve() -> ControlsView {
        return ControlsViewController()
    }
}