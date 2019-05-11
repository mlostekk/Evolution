// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import RxSwift

/// Simple world implementation
class SquareWorld: World {

    /// The array of all entities
    private var entities: [Entity] = [] {
        didSet {
            entitySubject.onNext(entities)
        }
    }

    /// Internal subject with all entities
    let entitySubject:  PublishSubject<[Entity]> = PublishSubject<[Entity]>()
    var entitiesStream: Observable<[Entity]> {
        return entitySubject
    }

    /// Reset to initial state
    func reset() {
        // Set entities
        var newEntities: [Entity] = []
        for _ in 1...10 {
            let entity = Entity(1, 20)
            newEntities.append(entity)
        }
        // Randomized distribution
        // TODO: optimize
        newEntities.forEach { entity in
            let side   = random(4)
            let amount = random(100)
            if side == 0 {
                entity.position = CGPoint(x: -50, y: amount - 50)
            } else if side == 1 {
                entity.position = CGPoint(x: amount - 50, y: 50)
            } else if side == 2 {
                entity.position = CGPoint(x: 50, y: amount - 50)
            } else if side == 3 {
                entity.position = CGPoint(x: amount - 50, y: -50)
            }
        }
        // set
        entities = newEntities
    }

    /// Simulate world one tick
    func tick() {

    }
}