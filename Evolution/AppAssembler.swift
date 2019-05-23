// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// Global assembler aggregate
protocol Assembler: SCNViewAssembler,
                    SquareWorldAssembler,
                    MainViewAssembler {

}

/// Global assembler instance
class AppAssembler: Assembler {

    func resolve() -> MainViewProtocol {
        return SceneKitController(assembler: self)
    }

}
