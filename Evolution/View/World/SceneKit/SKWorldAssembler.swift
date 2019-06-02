// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import CoreGraphics

/// The SceneKit specific assembler
protocol SKWorldAssembler: WorldViewAssembler {

    func resolve() -> WorldView
}


/// Implementation of the SceneKit specific assembler
extension SKWorldAssembler where Self: Assembler {

    func resolve() -> WorldView {
        return SKWorldController(world: resolve())
    }
}
