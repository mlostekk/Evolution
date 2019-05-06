//
//  AppViewController.swift
//  Evolution
//
//  Created by Martin Mlostek on 03.05.19.
//  Copyright © 2019 Nomad5. All rights reserved.
//

import UIKit
import SnapKit

class AppViewController: UIViewController {

    /// Global assembler
    private let assembler:              Assembler

    /// Main render view controller
    private let renderViewController:   RenderView

    /// Controls view controller
    private let controlsViewController: ControlsView

    /// Default constructor, shall not pass
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Construction with dependency resolver
    init(assembler: Assembler) {
        self.assembler = assembler
        self.controlsViewController = assembler.resolve()
        self.renderViewController = assembler.resolve()
        super.init(nibName: nil, bundle: nil)
    }

    /// View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        // add view controllers
        add(subviewController: controlsViewController) { make in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(80)
        }
        add(subviewController: renderViewController) { make in
            make.left.top.right.equalTo(view)
            make.bottom.equalTo(controlsViewController.view.snp.top)
        }
    }

    /// Convenience method to add sub view controller
    private func add(subviewController: UIViewController, constraints: (_ make: ConstraintMaker) -> Void) {
        subviewController.willMove(toParent: self)
        addChild(subviewController)
        view.addSubview(subviewController.view)
        subviewController.view.snp.makeConstraints(constraints)
        subviewController.didMove(toParent: self)
    }

    /// Auto rotation
    override var shouldAutorotate:       Bool {
        return true
    }

    /// Full screen
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
