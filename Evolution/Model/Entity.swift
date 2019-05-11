// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import UIKit
import RxSwift

/// Base entity that does evolution
class Entity {

    let positionStream: PublishSubject<CGPoint> = PublishSubject<CGPoint>()

    /// The entities position
    var position:       CGPoint             = .zero {
        didSet {
            positionStream.onNext(position)
        }
    }

    /// The entities current movement vector
    var movementVector: CGVector            = .zero

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