import Foundation

/// 2D Vector structure for position, velocity, etc.
public struct Vector2: Equatable, Codable {
    public var x: Float
    public var y: Float
    
    public init(x: Float = 0, y: Float = 0) {
        self.x = x
        self.y = y
    }
    
    /// Zero vector
    public static let zero = Vector2(x: 0, y: 0)
    
    /// Unit vector pointing right
    public static let right = Vector2(x: 1, y: 0)
    
    /// Unit vector pointing up
    public static let up = Vector2(x: 0, y: 1)
    
    /// Calculate magnitude of the vector
    public var magnitude: Float {
        return sqrt(x * x + y * y)
    }
    
    /// Calculate squared magnitude (more efficient when comparing distances)
    public var magnitudeSquared: Float {
        return x * x + y * y
    }
    
    /// Get normalized version of this vector
    public var normalized: Vector2 {
        let mag = magnitude
        guard mag > 0 else { return Vector2.zero }
        return Vector2(x: x / mag, y: y / mag)
    }
    
    /// Normalize this vector in place
    public mutating func normalize() {
        let mag = magnitude
        guard mag > 0 else {
            self = Vector2.zero
            return
        }
        x /= mag
        y /= mag
    }
    
    /// Calculate distance between two vectors
    public func distance(to other: Vector2) -> Float {
        return (self - other).magnitude
    }
    
    /// Calculate dot product
    public func dot(_ other: Vector2) -> Float {
        return x * other.x + y * other.y
    }
}

// MARK: - Operators
extension Vector2 {
    public static func + (lhs: Vector2, rhs: Vector2) -> Vector2 {
        return Vector2(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public static func - (lhs: Vector2, rhs: Vector2) -> Vector2 {
        return Vector2(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static func * (lhs: Vector2, rhs: Float) -> Vector2 {
        return Vector2(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    public static func * (lhs: Float, rhs: Vector2) -> Vector2 {
        return Vector2(x: lhs * rhs.x, y: lhs * rhs.y)
    }
    
    public static func / (lhs: Vector2, rhs: Float) -> Vector2 {
        return Vector2(x: lhs.x / rhs, y: lhs.y / rhs)
    }
    
    public static func += (lhs: inout Vector2, rhs: Vector2) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }
    
    public static func -= (lhs: inout Vector2, rhs: Vector2) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }
    
    public static func *= (lhs: inout Vector2, rhs: Float) {
        lhs.x *= rhs
        lhs.y *= rhs
    }
    
    public static func /= (lhs: inout Vector2, rhs: Float) {
        lhs.x /= rhs
        lhs.y /= rhs
    }
}
