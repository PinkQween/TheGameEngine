import XCTest
@testable import TheGameEngine

final class TheGameEngineTests: XCTestCase {
    
    func testVector2Operations() {
        let v1 = Vector2(x: 3, y: 4)
        let v2 = Vector2(x: 1, y: 2)
        
        // Test addition
        let sum = v1 + v2
        XCTAssertEqual(sum.x, 4)
        XCTAssertEqual(sum.y, 6)
        
        // Test magnitude
        XCTAssertEqual(v1.magnitude, 5.0, accuracy: 0.001)
        
        // Test normalization
        let normalized = v1.normalized
        XCTAssertEqual(normalized.magnitude, 1.0, accuracy: 0.001)
        
        // Test dot product
        let dot = v1.dot(v2)
        XCTAssertEqual(dot, 11.0) // 3*1 + 4*2 = 11
    }
    
    func testVector3Operations() {
        let v1 = Vector3(x: 1, y: 2, z: 2)
        let v2 = Vector3(x: 2, y: 1, z: 0)
        
        // Test cross product
        let cross = v1.cross(v2)
        XCTAssertEqual(cross.x, -2)
        XCTAssertEqual(cross.y, 4)
        XCTAssertEqual(cross.z, -3)
        
        // Test magnitude
        XCTAssertEqual(v1.magnitude, 3.0, accuracy: 0.001)
    }
    
    func testTransform() {
        var transform = Transform()
        
        // Test initial values
        XCTAssertEqual(transform.position, Vector3.zero)
        XCTAssertEqual(transform.scale, Vector3(x: 1, y: 1, z: 1))
        
        // Test translation
        transform.translate(Vector3(x: 5, y: 3, z: 2))
        XCTAssertEqual(transform.position.x, 5)
        XCTAssertEqual(transform.position.y, 3)
        XCTAssertEqual(transform.position.z, 2)
        
        // Test rotation
        transform.rotate(Vector3(x: 90, y: 0, z: 0))
        XCTAssertEqual(transform.rotation.x, 90)
    }
    
    func testGameObject() {
        let gameObject = GameObject(name: "TestObject")
        
        // Test initial state
        XCTAssertEqual(gameObject.name, "TestObject")
        XCTAssertTrue(gameObject.isActive)
        
        // Test component system (we'll create a simple test component)
        struct TestComponent: Component {
            var wasAttached = false
            var wasDetached = false
            
            mutating func onAttach() {
                wasAttached = true
            }
            
            mutating func onDetach() {
                wasDetached = true
            }
        }
        
        var testComponent = TestComponent()
        gameObject.addComponent(testComponent)
        
        // Test component retrieval
        XCTAssertTrue(gameObject.hasComponent(TestComponent.self))
        let retrievedComponent = gameObject.getComponent(TestComponent.self)
        XCTAssertNotNil(retrievedComponent)
    }
    
    func testScene() {
        let scene = Scene(name: "TestScene")
        let gameObject1 = GameObject(name: "Object1")
        let gameObject2 = GameObject(name: "Object2")
        
        // Test adding objects
        scene.addGameObject(gameObject1)
        scene.addGameObject(gameObject2)
        
        XCTAssertEqual(scene.getAllGameObjects().count, 2)
        
        // Test finding objects
        let foundObject = scene.findGameObject(named: "Object1")
        XCTAssertNotNil(foundObject)
        XCTAssertEqual(foundObject?.name, "Object1")
        
        // Test removing objects
        scene.removeGameObject(gameObject1)
        XCTAssertEqual(scene.getAllGameObjects().count, 1)
    }
    
    func testInput() {
        let input = Input()
        
        // Test key simulation
        input.simulateKeyPress(.a)
        XCTAssertTrue(input.isKeyDown(.a))
        XCTAssertFalse(input.isKeyDown(.b))
        
        // Update input to process the frame
        input.update()
        
        // Test key press detection
        input.simulateKeyPress(.b)
        XCTAssertTrue(input.isKeyPressed(.b)) // Should be true on first frame
        
        input.update()
        XCTAssertFalse(input.isKeyPressed(.b)) // Should be false after update
        XCTAssertTrue(input.isKeyDown(.b)) // But still held down
        
        // Test key release
        input.simulateKeyRelease(.a)
        XCTAssertTrue(input.isKeyReleased(.a))
        XCTAssertFalse(input.isKeyDown(.a))
    }
}
