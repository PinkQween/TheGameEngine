import Foundation
import TheGameEngine

// Simple movement component
class MovementComponent: Component {
    var velocity: Vector3
    var gameObject: GameObject?
    
    init(velocity: Vector3 = Vector3.zero) {
        self.velocity = velocity
    }
    
    func onAttach() {
        print("Movement component attached")
    }
    
    func update(deltaTime: Double) {
        guard let gameObject = gameObject else { return }
        
        let movement = velocity * Float(deltaTime)
        gameObject.transform.translate(movement)
        
        // Simple boundary check - reverse direction if object goes too far
        if abs(gameObject.transform.position.x) > 10 {
            velocity.x *= -1
        }
        if abs(gameObject.transform.position.z) > 10 {
            velocity.z *= -1
        }
    }
    
    func onDetach() {
        print("Movement component detached")
    }
}

// Demo function to show framework usage
func runDemo() {
    print("=== TheGameEngine Demo ===")
    
    // Initialize the engine
    TheGameEngine.initialize()
    
    // Create a scene
    let scene = Scene(name: "Demo Scene")
    
    // Create some game objects
    let player = GameObject(name: "Player")
    player.transform.position = Vector3(x: 0, y: 0, z: 0)
    
    let enemy = GameObject(name: "Enemy")
    enemy.transform.position = Vector3(x: 5, y: 0, z: 5)
    
    // Add movement components
    let playerMovement = MovementComponent(velocity: Vector3(x: 2, y: 0, z: 1))
    playerMovement.gameObject = player
    player.addComponent(playerMovement)
    
    let enemyMovement = MovementComponent(velocity: Vector3(x: -1, y: 0, z: -1.5))
    enemyMovement.gameObject = enemy
    enemy.addComponent(enemyMovement)
    
    // Add objects to scene
    scene.addGameObject(player)
    scene.addGameObject(enemy)
    
    // Load the scene in the engine
    GameEngine.shared.loadScene(scene)
    
    print("Demo setup complete!")
    print("Press Ctrl+C to stop the demo")
    
    // Set up signal handler to stop gracefully
    signal(SIGINT) { _ in
        print("\nStopping engine...")
        GameEngine.shared.stop()
        exit(0)
    }
    
    // Start the engine (this will run the game loop)
    GameEngine.shared.start()
}

// Run the demo
runDemo()
