//  Copyright © 2020 Martin Mlostek. All rights reserved.

import SwiftUI

struct AppView: View {
    var body: some View {
        VStack {
            ScenekitView()
            HStack {
                Text("blalballa1")
                        .foregroundColor(Color.red)
                Text("blalballa2")
                        .foregroundColor(Color.red)
                Text("blalballa3")
                        .foregroundColor(Color.red)
            }
        }
    }

}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
