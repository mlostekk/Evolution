// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import SceneKit

/// Calculate distance squared
func distanceSquared(_ from: SCNVector3, _ to: SCNVector3) -> Float {
    return (to.x - from.x) * (to.x - from.x) +
           (to.y - from.y) * (to.y - from.y) +
           (to.z - from.z) * (to.z - from.z)
}

/// Calculate real distance
func distance(_ from: SCNVector3, _ to: SCNVector3) -> Float {
    return sqrt(distanceSquared(from, to))
}