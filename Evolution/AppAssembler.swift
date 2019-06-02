// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// Global assembler aggregate
protocol Assembler: AppControllerAssembler,
                    SquareWorldAssembler,
                    SKWorldAssembler,
                    UIKitUserInterfaceAssembler {
}

/// Global assembler instance
class AppAssembler: Assembler {
}
