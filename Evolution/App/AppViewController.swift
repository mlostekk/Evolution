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
    private let assembler:            Assembler

    /// Main render view controller
    private let renderViewController: Renderer

    /// Default constructor, shall not pass
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Construction with dependency resolver
    init(assembler: Assembler) {
        self.assembler = assembler
        self.renderViewController = assembler.resolve()
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // add top view controller
        renderViewController.willMove(toParent: self)
        addChild(renderViewController)
        view.addSubview(renderViewController.view)
        renderViewController.view.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(view)
        }
        renderViewController.didMove(toParent: self)
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
