//  Copyright © 2019 Nomad5. All rights reserved.

import RxSwift
import SnapKit
import UIKit

/// The UIKit based ui controller
class UIKitUserInterfaceController: NSObject, UserInterfaceView {

    // TODO
    let slider = UISlider(frame: CGRect(x: 20, y: 20, width: 280, height: 20))

    /// Construction
    override init() {
        super.init()
    }

    /// TODO
    func initialize(within view: UIView) {
        view.addSubview(slider)
    }
}
