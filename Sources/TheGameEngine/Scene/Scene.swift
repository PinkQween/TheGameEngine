import Foundation

/// Scene class that manages game objects
public class Scene {
    public var name: String
    private var gameObjects: [GameObject] = []
    
    public init(name: String = "Scene") {
        self.name = name
    }
    
    /// Add a game object to the scene
    public func addGameObject(_ gameObject: GameObject) {
        gameObjects.append(gameObject)
    }
    
    /// Remove a game object from the scene
    public func removeGameObject(_ gameObject: GameObject) {
        gameObjects.removeAll { $0.id == gameObject.id }
    }
    
    /// Find a game object by name
    public func findGameObject(named name: String) -> GameObject? {
        return gameObjects.first { $0.name == name }
    }
    
    /// Get all game objects
    public func getAllGameObjects() -> [GameObject] {
        return gameObjects
    }
    
    /// Called when the scene is loaded
    public func onLoad() {
        print("Scene '\(name)' loaded")
    }
    
    /// Update all game objects in the scene
    internal func update(deltaTime: Double) {
        for gameObject in gameObjects {
            gameObject.update(deltaTime: deltaTime)
        }
    }
    
    /// Render all game objects in the scene
    internal func render(renderer: Renderer) {
        for gameObject in gameObjects {
            // Only render active objects
            if gameObject.isActive {
                renderer.renderGameObject(gameObject)
            }
        }
    }
    
    /// Destroy the scene and all its game objects
    public func destroy() {
        for gameObject in gameObjects {
            gameObject.destroy()
        }
        gameObjects.removeAll()
    }
}
