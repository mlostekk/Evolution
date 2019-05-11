// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// Get random number between 0..n-1
func random(_ n : Int) -> Int {
    return Int(arc4random_uniform(UInt32(n)))
}
