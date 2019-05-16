// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import RxSwift

/// Simple world implementation
class SquareWorld: World {

    /// The array of all entities
    private var entities:      [Entity]               = []
    /// The array of all food
    private var food:          [Food]                 = []

    /// Bounds
    private let dimension:     Float                  = 50.0

    /// Subject and stream with all entities
    private let entitySubject: PublishSubject<Entity> = PublishSubject<Entity>()
    var entityStream: Observable<Entity> { return entitySubject }

    /// Subject and stream for all food
    private let foodSubject: PublishSubject<Food> = PublishSubject<Food>()
    var foodStream: Observable<Food> { return foodSubject }

    /// Reset to initial state
    func reset() {
        // Create entities
        entities = []
        for _ in 1...10 {
            let entity = Entity(1, 20)
            let side   = random(4)
            let amount = Float(random(100))
            if side == 0 {
                entity.position = Vector3(-dimension, amount - dimension, 0)
            } else if side == 1 {
                entity.position = Vector3(amount - dimension, dimension, 0)
            } else if side == 2 {
                entity.position = Vector3(dimension, amount - dimension, 0)
            } else if side == 3 {
                entity.position = Vector3(amount - dimension, -dimension, 0)
            }
            entity.movementVector = Vector3.zero - entity.position
            entities.append(entity)
            // emit
            entitySubject.onNext(entity)
        }
        // Create food
        for _ in 1...10 {
            let newFood = Food(Vector3(random(Int(-dimension), Int(dimension)),
                                       random(Int(-dimension), Int(dimension)),
                                       0))

            food.append(newFood)
            // emit
            foodSubject.onNext(newFood)
        }

    }

    /// Simulate world one tick
    func tick() {
        /// Process all entities

        // find out moving vector

        // 1. Check if food is in sight

        // 2. Check if enemy is in sight

        // move

        // replicate & mutate

    }
}
