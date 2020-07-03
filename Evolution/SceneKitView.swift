import SwiftUI
import SceneKit

struct ScenekitView : UIViewRepresentable {
    let scene = SCNScene(named: "Assets.scnassets/MainScene.scn")!

    func makeUIView(context: Context) -> SCNView {
        // retrieve the SCNView
        let scnView = SCNView()
        scnView.scene = scene
        return scnView
    }

    func updateUIView(_ scnView: SCNView, context: Context) {
        scnView.scene = scene

        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true

        // show statistics such as fps and timing information
        scnView.showsStatistics = true

        // configure the view
        scnView.backgroundColor = UIColor.black
    }
}

#if DEBUG
struct ScenekitView_Previews : PreviewProvider {
    static var previews: some View {
        ScenekitView()
    }
}
#endif
