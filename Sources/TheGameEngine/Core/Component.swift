import Foundation

/// Protocol that all game object components must conform to
public protocol Component {
    /// Called when the component is added to a game object
    func onAttach()
    
    /// Called every frame to update the component
    func update(deltaTime: Double)
    
    /// Called when the component is removed from a game object
    func onDetach()
}

/// Default implementations to make methods optional
public extension Component {
    func onAttach() { }
    func update(deltaTime: Double) { }
    func onDetach() { }
}
