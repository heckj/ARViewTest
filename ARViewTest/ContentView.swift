//
//  ContentView.swift
//  ARViewTest
//
//  Created by Joseph Heck on 6/22/22.
//

import SwiftUI
import RealityKit

class CustomBox: Entity, HasModel, HasAnchoring, HasCollision {
    
    required init(color: NSColor) {
        super.init()
        self.components[ModelComponent.self] = ModelComponent(
            mesh: .generateBox(size: 0.1),
            materials: [SimpleMaterial(
                color: color,
                isMetallic: false)
            ]
        )
    }
    
    convenience init(color: NSColor, position: SIMD3<Float>) {
        self.init(color: color)
        self.position = position
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}

struct ContentView: View {
    
    func provideLoadedARView() -> ARView {
        let view = ARView(frame: .zero)
        let box = CustomBox(color: .yellow)
        view.scene.anchors.append(box)
        return view
    }
    
    var body: some View {
        VStack {
            ARViewContainer(cameraARView: provideLoadedARView())
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
