//  Copyright © 2019 Nomad5. All rights reserved.

import Foundation

#if os(macOS)
    import Cocoa
    typealias XColor = NSColor
    typealias XView = NSView
#else
    import UIKit
    typealias XColor = UIColor
    typealias XView = UIView
#endif