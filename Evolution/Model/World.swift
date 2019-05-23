// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import RxSwift

/// Interface for the world simulator
protocol World {

    // Reset the world
    func reset()

    /// Simulate one tick
    func tick()

    /// The stream with new entities
    var entityStream: Observable<Entity> { get }

    /// The stream with new food
    var foodStream: Observable<Food> { get }
}

