// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// The main root controller assembler
protocol AppControllerAssembler {

    func resolve() -> AppController
}

/// The main assembler of the root controller
extension AppControllerAssembler where Self: Assembler {

    func resolve() -> AppController {
        return MainAppController(rootView: resolve(),
                                 world: resolve())
    }
}