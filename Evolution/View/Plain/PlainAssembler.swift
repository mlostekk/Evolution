// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import CoreGraphics

/// The SceneKit specific assembler
protocol PlainAssembler: ViewAssembler {

    func resolve() -> UserInterfaceView
}


/// Implementation of the SceneKit specific assembler
extension PlainAssembler where Self: Assembler {

    func resolve() -> UserInterfaceView {
        return PlainController()
    }
}
