//  Copyright © 2019 Nomad5. All rights reserved.


import QuartzCore
import SceneKit
import SnapKit
import RxSwift

class SCNViewController: RenderView {
    required init(world: World) {
        
    }

    
}

/*
class SCNViewController: UIViewController, RenderView {

    let sceneView: SCNView = SCNView()

    var scene:          SCNScene?  = nil

    /// Rx disposal
    let disposeBag:     DisposeBag = DisposeBag()

    /// The entity root node
    let entityRootNode: SCNNode    = SCNNode()

    /// Default constructor, shall not pass
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Construction with dependencies
    required init(world: World) {
        super.init(nibName: nil, bundle: nil)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // constraints
        view.addSubview(sceneView)
        sceneView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }


        // create a new scene
        scene = SCNScene(named: "Assets.scnassets/MainScene.scn")!

        // create and add a camera to the scene
        //let cameraNode = SCNNode()
        //cameraNode.camera = SCNCamera()
        //scene?.rootNode.addChildNode(cameraNode)
//
        //// place the camera
        //cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)

        // create and add a light to the scene
        //let lightNode = SCNNode()
        //lightNode.light = SCNLight()
        //lightNode.light!.type = .omni
        //lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        //scene?.rootNode.addChildNode(lightNode)
//
        //// create and add an ambient light to the scene
        //let ambientLightNode = SCNNode()
        //ambientLightNode.light = SCNLight()
        //ambientLightNode.light!.type = .ambient
        //ambientLightNode.light!.color = UIColor.darkGray
        //scene?.rootNode.addChildNode(ambientLightNode)

        // retrieve the ship node
        //let entity = scene.rootNode.childNode(withName: "Entity", recursively: true)

        // animate the 3d object
        //entity?.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))

        // set the scene to the view
        sceneView.scene = scene

        // allows the user to manipulate the camera
        sceneView.allowsCameraControl = true

        // show statistics such as fps and timing information
        sceneView.showsStatistics = true

        // configure the view
        sceneView.backgroundColor = UIColor.black

        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)

        // create plane
        //let plane = SCNPlane(width: 10, height: 10)
        //let material = SCNMaterial()
        //material.diffuse.contents = UIImage(named: "Assets.scnassets/checkerboard.jpg")
        //let p = SCNNode(geometry: plane)
        //scene.rootNode.addChildNode(p)
        //p.geometry?.firstMaterial?.diffuse.wrapS = SCNWrapMode.repeat
        //p.geometry?.firstMaterial?.diffuse.wrapT = SCNWrapMode.repeat
        //material.diffuse.contentsTransform = SCNMatrix4MakeScale(32, 32, 0)

        //spawnEntity()

        scene?.rootNode.addChildNode(entityRootNode)
    }

    /// Click handler
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {

        // check what nodes are tapped
        let p          = gestureRecognize.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result   = hitResults[0]

            // get its material
            let material = result.node.geometry!.firstMaterial!

            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5

            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5

                material.emission.contents = UIColor.black

                SCNTransaction.commit()
            }

            material.emission.contents = UIColor.red

            SCNTransaction.commit()
        }
    }


}
*/
