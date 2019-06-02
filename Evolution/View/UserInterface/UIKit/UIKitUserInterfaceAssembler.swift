// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import CoreGraphics

/// The User interface assembler
protocol UIKitUserInterfaceAssembler: UserInterfaceViewAssembler {

    func resolve() -> UserInterfaceView
}


/// Implementation of the user interface assembler based on UIKit
extension UIKitUserInterfaceAssembler where Self: Assembler {

    func resolve() -> UserInterfaceView {
        return UIKitUserInterfaceController()
    }
}
