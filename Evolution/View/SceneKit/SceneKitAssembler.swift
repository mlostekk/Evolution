// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import CoreGraphics

/// The SceneKit specific assembler
protocol SceneKitAssembler: ViewAssembler {

    func resolve() -> RootView
}


/// Implementation of the SceneKit specific assembler
extension SceneKitAssembler where Self: Assembler {

    func resolve() -> RootView {
        return SceneKitController(world: resolve())
    }
}
