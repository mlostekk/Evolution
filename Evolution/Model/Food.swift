// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import UIKit
import RxSwift

/// Food entity
class Food {

    /// The entities position
    let position: CGPoint

    /// Construction
    init(_ position: CGPoint) {
        self.position = position
    }
}