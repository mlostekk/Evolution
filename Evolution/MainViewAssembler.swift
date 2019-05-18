// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import CoreGraphics

/// The SceneKit specific assembler
protocol MainViewAssembler {

    func resolve() -> MainViewProtocol
}


/// Implementation of the SceneKit specific assembler
extension MainViewAssembler where Self: Assembler {

    func resolve() -> MainViewProtocol {
        return SceneKitController()
    }
}


protocol MainViewProtocol {

    /// get view
    func initializeWith(size: CGSize) -> XView

    /// get view
    func getView() -> XView

    /// click
    func highlightNodes(atPoint point: CGPoint)

}