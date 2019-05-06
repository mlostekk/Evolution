//
//  AppViewController.swift
//  Evolution
//
//  Created by Martin Mlostek on 03.05.19.
//  Copyright © 2019 Nomad5. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SnapKit

class ControlsViewController: UIViewController, ControlsView {

    /// Default constructor, shall not pass
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Construction with dependencies
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    /// View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        // constraints
        view.backgroundColor = .yellow


    }

}
