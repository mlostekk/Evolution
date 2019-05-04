// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// Base entity that does evolution
class Entity {

    /// Movement speed
    let speed:  Double

    /// Energy
    let energy: Double

    /// Construction
    init(_ speed: Double,
         _ energy: Double) {
        self.speed = speed
        self.energy = energy
    }
}