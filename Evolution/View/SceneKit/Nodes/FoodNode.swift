// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import SceneKit

/// Wrapper node with the entity
class FoodNode: SCNNode {

    /// Reference to the entity
    let food: Food

    /// Required init
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }

    /// Construction with entity
    init(food: Food) {
        self.food = food
        super.init()
        self.geometry = SCNSphere(radius: 1)
        let material = SCNMaterial()
        //material.diffuse.contents = UIColor.blue
        self.geometry?.materials = [material]
        self.position = SCNVector3(food.position.x, 0, food.position.y)
    }
}
