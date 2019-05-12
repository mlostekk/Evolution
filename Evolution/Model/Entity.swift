// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import UIKit
import RxSwift

/// Base entity that does evolution
class Entity {

    /// The entities position
    var position:       CGPoint  = .zero

    /// The entities current movement vector
    var movementVector: CGVector = .zero

    /// Movement speed
    let speed:          Double

    /// Energy
    var energy:         Double

    /// Construction
    init(_ speed: Double,
         _ energy: Double) {
        self.speed = speed
        self.energy = energy
    }
}