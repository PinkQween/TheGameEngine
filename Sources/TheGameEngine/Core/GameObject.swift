import Foundation

/// Game object that can have components attached
public class GameObject {
    public let id: UUID
    public var name: String
    public var transform: Transform
    public private(set) var isActive: Bool
    
    private var components: [String: Component] = [:]
    
    public init(name: String = "GameObject") {
        self.id = UUID()
        self.name = name
        self.transform = Transform()
        self.isActive = true
    }
    
    /// Add a component to this game object
    public func addComponent<T: Component>(_ component: T) {
        let key = String(describing: T.self)
        components[key] = component
        component.onAttach()
    }
    
    /// Get a component of the specified type
    public func getComponent<T: Component>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        return components[key] as? T
    }
    
    /// Remove a component of the specified type
    public func removeComponent<T: Component>(_ type: T.Type) {
        let key = String(describing: type)
        if let component = components[key] {
            component.onDetach()
            components.removeValue(forKey: key)
        }
    }
    
    /// Check if this game object has a component of the specified type
    public func hasComponent<T: Component>(_ type: T.Type) -> Bool {
        let key = String(describing: type)
        return components[key] != nil
    }
    
    /// Update all components
    internal func update(deltaTime: Double) {
        guard isActive else { return }
        
        for component in components.values {
            component.update(deltaTime: deltaTime)
        }
    }
    
    /// Set active state
    public func setActive(_ active: Bool) {
        isActive = active
    }
    
    /// Destroy this game object and clean up components
    public func destroy() {
        for component in components.values {
            component.onDetach()
        }
        components.removeAll()
        isActive = false
    }
}
