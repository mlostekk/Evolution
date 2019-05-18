// Copyright (c) 2019 Nomad5. All rights reserved.

import RxSwift

/// Global instance of the world
private var world: World?


/// The SceneKit specific assembler
protocol SquareWorldAssembler: ViewAssembler {

    func resolve() -> World
}


/// Implementation
extension SquareWorldAssembler where Self: Assembler {

    /// Return square world
    func resolve() -> World {
        if let w = world {
            return w
        }
        let newWorld = SquareWorld()
        world = newWorld
        return newWorld
    }
}
