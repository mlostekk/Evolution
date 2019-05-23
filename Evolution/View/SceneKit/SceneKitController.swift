//  Copyright © 2019 Nomad5. All rights reserved.

import SceneKit
import RxSwift

/// The SceneKit controller
class SceneKitController: NSObject, RootView, SCNSceneRendererDelegate {

    /// The world
    private let world:     World
    /// The main view
    var view: SCNView = SCNView(frame: .zero)

    /// Rx dispose bag
    private let disposeBag: DisposeBag = DisposeBag()
    /// The scene
    var scene:          SCNScene?

    /// The entity root node
    let entityRootNode: SCNNode = SCNNode()

    /// Construction with dependenceis
    init(world: World) {
        self.world = world
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
        scene = SCNScene(named: "Assets.scnassets/MainScene.scn")!


        /// set the scene to the view
        view.scene = scene

        // allows the user to manipulate the camera
        view.allowsCameraControl = true

        // show statistics such as fps and timing information
        view.showsStatistics = true

        // configure the view
        view.backgroundColor = XColor.black

        scene?.rootNode.addChildNode(entityRootNode)

        view.delegate = self

//        if let ship = scene.rootNode.childNode(withName: "ship", recursively: true) {
//            ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
//        }

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

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        // Called before each frame is rendered
    }
}
