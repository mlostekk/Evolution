// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// The main root view assembler
protocol RootViewAssembler {

    func resolve() -> RootViewProtocol
}
