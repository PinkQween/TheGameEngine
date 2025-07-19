import Foundation

/// TheGameEngine - A cross-platform game engine framework
public struct TheGameEngine {
    public static let version = "1.0.0"
    
    /// Initialize the game engine
    public static func initialize() {
        print("TheGameEngine v\(version) initialized")
    }
}

// Re-export all public types - these will be available when importing TheGameEngine
// The actual types are defined in their respective files
