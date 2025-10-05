//
//  GameRunner.swift
//  TheGameEngine
//
//  Created by Hanna Skairipa on 10/5/25.
//

public final class GameRunner<AppType: Game> {
    private let app: AppType
    private let backend: RenderBackend
    
    public init(backend: RenderBackend) {
        self.app = AppType()
        self.backend = backend
    }
    
    public func run() {
        print("🚀 TheGameEngine is starting...")
        render(scene: app.body, indent: 0)
    }
    
    private func render<S: GameScene>(scene: S, indent: Int) {
        let padding = String(repeating: "  ", count: indent)
        print("\(padding)🎮 Scene: \(type(of: scene))")

        if let mProv = scene as? any MeshProvider {
            let mesh = mProv.mesh
            print("\(padding)  🧩 Mesh: vertices=\(mesh.vertexCount), triangles=\(mesh.triangleCount)")

            // Platform-agnostic backend calls
            backend.upload(mesh: mesh)
            backend.draw(mesh: mesh)
        }

        // Recurse into body if it's not EmptyScene and not self
        let child = scene.body
        if !(child is EmptyScene) && type(of: child) != type(of: scene) {
            render(scene: child, indent: indent + 1)
        }
    }
}

