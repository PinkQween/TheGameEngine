# TheGameEngine

A cross-platform game engine framework built in Swift that can be used without Xcode.

## Features

- **Cross-platform**: Works on macOS, iOS, tvOS, and watchOS
- **Component-based architecture**: Flexible entity-component system
- **Math utilities**: Vector2, Vector3 with common operations
- **Scene management**: Organize game objects into scenes
- **Input system**: Keyboard input handling
- **No Xcode required**: Built using Swift Package Manager

## Requirements

- Swift 5.9 or later
- macOS 12+ (for development)
- Swift Package Manager

## Installation

### Using Swift Package Manager

Add TheGameEngine to your `Package.swift`:

```swift
dependencies: [
    .package(url: "path/to/TheGameEngine", from: "1.0.0")
]
```

### Building from Source

```bash
# Clone the repository
git clone /path/to/TheGameEngine
cd TheGameEngine

# Build the framework
swift build

# Run tests
swift test

# Run the demo
swift run GameEngineDemo
```

## Quick Start

Here's a simple example of how to use TheGameEngine:

```swift
import TheGameEngine

// Create a custom component
class RotationComponent: Component {
    var rotationSpeed: Float = 45.0 // degrees per second
    
    func update(deltaTime: Double) {
        guard let gameObject = gameObject else { return }
        let rotation = Vector3(x: 0, y: rotationSpeed * Float(deltaTime), z: 0)
        gameObject.transform.rotate(rotation)
    }
}

// Set up your game
func setupGame() {
    // Initialize the engine
    TheGameEngine.initialize()
    
    // Create a scene
    let scene = Scene(name: "Main Scene")
    
    // Create a game object
    let cube = GameObject(name: "Rotating Cube")
    cube.addComponent(RotationComponent())
    
    // Add to scene
    scene.addGameObject(cube)
    
    // Load scene and start
    GameEngine.shared.loadScene(scene)
    GameEngine.shared.start()
}
```

## Architecture

### Core Components

- **GameEngine**: Main engine class that manages the game loop
- **GameObject**: Entity that can have components attached
- **Component**: Protocol for creating reusable game object behaviors
- **Scene**: Container for managing collections of game objects
- **Transform**: Handles position, rotation, and scale

### Math System

- **Vector2**: 2D vector operations
- **Vector3**: 3D vector operations with cross product support

### Systems

- **Renderer**: Basic rendering system (extensible)
- **Input**: Keyboard input handling

## Building Without Xcode

This framework is designed to work entirely through the command line using Swift Package Manager:

### Building the Framework

```bash
# Build in debug mode
swift build

# Build in release mode
swift build -c release

# Build for a specific platform
swift build --arch arm64
```

### Running Tests

```bash
# Run all tests
swift test

# Run specific tests
swift test --filter TheGameEngineTests
```

### Creating Documentation

```bash
# Generate documentation (requires swift-docc-plugin)
swift package generate-documentation
```

## Examples

### Creating a Moving Object

```swift
class MovementComponent: Component {
    var velocity: Vector3
    
    init(velocity: Vector3) {
        self.velocity = velocity
    }
    
    func update(deltaTime: Double) {
        guard let gameObject = gameObject else { return }
        let movement = velocity * Float(deltaTime)
        gameObject.transform.translate(movement)
    }
}

// Usage
let player = GameObject(name: "Player")
player.addComponent(MovementComponent(velocity: Vector3(x: 5, y: 0, z: 0)))
```

### Input Handling

```swift
class PlayerController: Component {
    func update(deltaTime: Double) {
        guard let gameObject = gameObject else { return }
        
        let input = GameEngine.shared.input
        var movement = Vector3.zero
        
        if input.isKeyDown(.w) { movement.z += 1 }
        if input.isKeyDown(.s) { movement.z -= 1 }
        if input.isKeyDown(.a) { movement.x -= 1 }
        if input.isKeyDown(.d) { movement.x += 1 }
        
        if movement != Vector3.zero {
            movement = movement.normalized * 5.0 * Float(deltaTime)
            gameObject.transform.translate(movement)
        }
    }
}
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Run tests: `swift test`
6. Submit a pull request

## License

This project is available under the MIT license. See the LICENSE file for more info.

## Roadmap

- [ ] Audio system
- [ ] Physics integration
- [ ] Asset loading system
- [ ] Networking support
- [ ] Platform-specific renderers (Metal, OpenGL)
- [ ] Entity-Component-System improvements
- [ ] Performance profiling tools
