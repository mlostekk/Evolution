// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import UIKit
import RxSwift

/// Food entity
class Food {

    /// The entities position
    let position: Vector3

    /// Construction
    init(_ position: Vector3) {
        self.position = position
    }
}
