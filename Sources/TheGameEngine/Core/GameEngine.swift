import Foundation

/// Main game engine class that manages the game loop and systems
public final class GameEngine {
    public static let shared = GameEngine()
    
    private var isRunning = false
    private var currentScene: Scene?
    private var renderer: Renderer
    public private(set) var input: Input
    
    private init() {
        self.renderer = Renderer()
        self.input = Input()
    }
    
    /// Start the game engine
    public func start() {
        guard !isRunning else { return }
        isRunning = true
        print("Game Engine started")
        gameLoop()
    }
    
    /// Stop the game engine
    public func stop() {
        isRunning = false
        print("Game Engine stopped")
    }
    
    /// Load a scene
    public func loadScene(_ scene: Scene) {
        currentScene = scene
        scene.onLoad()
    }
    
    /// Main game loop
    private func gameLoop() {
        let targetFPS: Double = 60.0
        let frameTime: Double = 1.0 / targetFPS
        var lastTime = CFAbsoluteTimeGetCurrent()
        
        while isRunning {
            let currentTime = CFAbsoluteTimeGetCurrent()
            let deltaTime = currentTime - lastTime
            
            if deltaTime >= frameTime {
                update(deltaTime: deltaTime)
                render()
                lastTime = currentTime
            }
            
            // Small sleep to prevent busy waiting
            usleep(1000) // 1ms
        }
    }
    
    /// Update game logic
    private func update(deltaTime: Double) {
        input.update()
        currentScene?.update(deltaTime: deltaTime)
    }
    
    /// Render frame
    private func render() {
        renderer.clear()
        currentScene?.render(renderer: renderer)
        renderer.present()
    }
}
