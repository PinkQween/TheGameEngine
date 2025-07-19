import Foundation

/// Key codes for input handling
public enum KeyCode: Int, CaseIterable {
    case space = 32
    case a = 97, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
    case escape = 27
    case enter = 13
    case tab = 9
    case backspace = 8
    case up = 259
    case down = 258
    case left = 260
    case right = 261
}

/// Input system for handling keyboard and mouse input
public class Input {
    private var currentKeys: Set<KeyCode> = []
    private var previousKeys: Set<KeyCode> = []
    
    public init() {
        print("Input system initialized")
    }
    
    /// Update input state (called every frame)
    internal func update() {
        previousKeys = currentKeys
        
        // In a real implementation, this would poll the actual input devices
        // For demonstration purposes, we'll simulate some basic input
    }
    
    /// Check if a key is currently being held down
    public func isKeyDown(_ key: KeyCode) -> Bool {
        return currentKeys.contains(key)
    }
    
    /// Check if a key was just pressed this frame
    public func isKeyPressed(_ key: KeyCode) -> Bool {
        return currentKeys.contains(key) && !previousKeys.contains(key)
    }
    
    /// Check if a key was just released this frame
    public func isKeyReleased(_ key: KeyCode) -> Bool {
        return !currentKeys.contains(key) && previousKeys.contains(key)
    }
    
    /// Simulate key press (for testing/demonstration)
    public func simulateKeyPress(_ key: KeyCode) {
        currentKeys.insert(key)
    }
    
    /// Simulate key release (for testing/demonstration)
    public func simulateKeyRelease(_ key: KeyCode) {
        currentKeys.remove(key)
    }
    
    /// Get all currently pressed keys
    public func getPressedKeys() -> Set<KeyCode> {
        return currentKeys
    }
}
