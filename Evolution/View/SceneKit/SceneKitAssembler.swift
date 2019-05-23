// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import CoreGraphics

/// The SceneKit specific assembler
protocol SceneKitAssembler: RootViewAssembler {

    func resolve() -> RootViewProtocol
}


/// Implementation of the SceneKit specific assembler
extension SceneKitAssembler where Self: Assembler {

    func resolve() -> RootViewProtocol {
        return SceneKitController(world: resolve())
    }
}
