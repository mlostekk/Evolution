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
import RxSwift
import RxCocoa

class ControlsViewController: UIViewController, ControlsView {

    /// Rx disposal
    let disposeBag: DisposeBag = DisposeBag()

    /// Step button plus stream
    let stepButton = UIButton(type: .system)
    var stepButtonStream: Observable<Void> {
        return stepButton.rx.tap.asObservable()
    }

    /// Reset button plus stream
    let resetButton = UIButton(type: .system)
    var resetButtonStream: Observable<Void> {
        return resetButton.rx.tap.asObservable()
    }

    /// Settings button plus stream
    let settingsButton = UIButton(type: .system)
    var settingsButtonStream: Observable<Void> {
        return settingsButton.rx.tap.asObservable()
    }

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

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        // Add control view
        resetButton.setImage(#imageLiteral(resourceName: "buttonReset"), for: .normal)
        stackView.addArrangedSubview(resetButton)

        stepButton.setImage(#imageLiteral(resourceName: "buttonNext"), for: .normal)
        stackView.addArrangedSubview(stepButton)

        settingsButton.setImage(#imageLiteral(resourceName: "buttonSettings"), for: .normal)
        stackView.addArrangedSubview(settingsButton)
    }

}
