// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// Global assembler aggregate
protocol Assembler: SquareWorldAssembler,
                    SceneKitAssembler {
}

/// Global assembler instance
class AppAssembler: Assembler {
}
