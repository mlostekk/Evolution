// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import SceneKit

/// Wrapper node with the entity
class EntityNode: SCNReferenceNode {

    /// Reference to the entity
    let entity: Entity

    /// Create convenience function
    static func createWith(entity: Entity) -> EntityNode? {
        if let path = Bundle.main.path(forResource: "Android", ofType: "dae", inDirectory: "Assets.scnassets") {
            let url = URL(fileURLWithPath: path)
            if let node = EntityNode(url: url, entity: entity) {
                node.load()
                return node
            }
        }
        return nil
    }

    /// Required init
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }

    /// Construction with entity
    init?(url: URL, entity: Entity) {
        self.entity = entity
        super.init(url: url)
        self.position = SCNVector3(entity.position.x, 0, entity.position.y)
    }
}