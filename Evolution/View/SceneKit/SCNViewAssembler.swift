// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// The SceneKit specific assembler
protocol SCNViewAssembler: ViewAssembler {

    func resolve() -> RenderView
}


/// Implementation of the SceneKit specific assembler
extension SCNViewAssembler where Self: Assembler {

    func resolve() -> RenderView {
        return SCNViewController(world: resolve())
    }
}