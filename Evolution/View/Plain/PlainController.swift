//  Copyright © 2019 Nomad5. All rights reserved.

import RxSwift

/// The SceneKit controller
class PlainController: NSObject, UserInterfaceView {

    let slider = UISlider(frame: CGRect(x: 20, y: 20, width: 280, height: 20))

    /// Construction with dependencies
    override init() {
        super.init()
    }

    func initialize(within view: UIView) {
        view.addSubview(slider)
    }
}
