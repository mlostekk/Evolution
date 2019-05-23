// Copyright (c) 2019 Nomad5. All rights reserved.

import RxSwift

/// Global instance of the world
private var squareWorld: World = SquareWorld()


/// The SceneKit specific assembler
protocol SquareWorldAssembler: WorldAssembler {

    func resolve() -> World
}


/// Implementation
extension SquareWorldAssembler where Self: Assembler {

    /// Return square world
    func resolve() -> World {
        return squareWorld
    }
}
