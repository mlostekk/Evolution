// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation

/// The main world view assembler
protocol WorldViewAssembler {

    func resolve() -> WorldView
}
