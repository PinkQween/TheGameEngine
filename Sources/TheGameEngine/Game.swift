//
//  Game.swift
//  TheGameEngine
//
//  Created by Hanna Skairipa on 10/5/25.
//

public protocol Game {
    associatedtype Content: GameScene
    
    init()
    var body: Content { get }
}

extension Game {
    /// Lets a game struct be the entrypoint when annotated with `@main`.
    public static func main() {
        let backend: RenderBackend
        
#if os(macOS)
        backend = MetalRenderBackend()
#elseif os(Linux)
        backend = LinuxRenderBackend()
#else
        backend = LinuxRenderBackend()
#endif
        
        GameRunner<Self>(backend: backend).run()
    }
}
