//  Copyright © 2019 Nomad5. All rights reserved.

import SceneKit
import RxSwift

/// The SceneKit controller
class SKWorldController: NSObject, WorldView, SCNSceneRendererDelegate {

    /// The main SceneKit view
    private var view:           SCNView    = SCNView(frame: .zero)

    /// Rx disposal
    private let disposeBag:     DisposeBag = DisposeBag()

    /// The entity root node
    private let entityRootNode: SCNNode    = SCNNode()

    /// The scene
    private var scene:          SCNScene?

    /// Construction with dependencies
    init(world: World) {
        super.init()
        world.entityStream.subscribe(onNext: handleNewEntity).disposed(by: disposeBag)
        world.foodStream.subscribe(onNext: handleNewFood).disposed(by: disposeBag)
    }

    /// Handler for incoming entities
    private func handleNewEntity(entity: Entity) {
        if let newEntityNode = EntityNode.createWith(entity: entity) {
            entityRootNode.addChildNode(newEntityNode)
            newEntityNode.look(at: SCNVector3())
        }
    }

    /// Handler for incoming foods
    private func handleNewFood(food: Food) {
        let newFoodNode = FoodNode(food: food)
        entityRootNode.addChildNode(newFoodNode)
    }

    /// Create the view
    func initialize(with size: CGSize) -> XView {
        view.frame = CGRect(origin: .zero, size: size)
        scene = SCNScene(named: "Assets.scnassets/MainScene.scn")
        scene?.rootNode.addChildNode(entityRootNode)

        /// set the scene to the view
        view.scene = scene
        // allows the user to manipulate the camera
        view.allowsCameraControl = true
        // show statistics such as fps and timing information
        view.showsStatistics = true
        // set the view delegate
        view.delegate = self
        /// set the scene
        view.scene = scene

        return view
    }

    /// Handle click
    func handleClick(atPoint point: CGPoint) {
        let hitResults = self.view.hitTest(point, options: [:])
        for result in hitResults {
            // get its material
            guard let material = result.node.geometry?.firstMaterial else {
                return
            }

            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5

            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5

                material.emission.contents = XColor.black

                SCNTransaction.commit()
            }

            material.emission.contents = XColor.red

            SCNTransaction.commit()
        }
    }

    // Called before each frame is rendered
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {

    }
}
