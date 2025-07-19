import Foundation

/// 3D Vector structure for position, velocity, etc.
public struct Vector3: Equatable, Codable {
    public var x: Float
    public var y: Float
    public var z: Float
    
    public init(x: Float = 0, y: Float = 0, z: Float = 0) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    /// Zero vector
    public static let zero = Vector3(x: 0, y: 0, z: 0)
    
    /// Unit vector pointing right
    public static let right = Vector3(x: 1, y: 0, z: 0)
    
    /// Unit vector pointing up
    public static let up = Vector3(x: 0, y: 1, z: 0)
    
    /// Unit vector pointing forward
    public static let forward = Vector3(x: 0, y: 0, z: 1)
    
    /// Calculate magnitude of the vector
    public var magnitude: Float {
        return sqrt(x * x + y * y + z * z)
    }
    
    /// Calculate squared magnitude (more efficient when comparing distances)
    public var magnitudeSquared: Float {
        return x * x + y * y + z * z
    }
    
    /// Get normalized version of this vector
    public var normalized: Vector3 {
        let mag = magnitude
        guard mag > 0 else { return Vector3.zero }
        return Vector3(x: x / mag, y: y / mag, z: z / mag)
    }
    
    /// Normalize this vector in place
    public mutating func normalize() {
        let mag = magnitude
        guard mag > 0 else {
            self = Vector3.zero
            return
        }
        x /= mag
        y /= mag
        z /= mag
    }
    
    /// Calculate distance between two vectors
    public func distance(to other: Vector3) -> Float {
        return (self - other).magnitude
    }
    
    /// Calculate dot product
    public func dot(_ other: Vector3) -> Float {
        return x * other.x + y * other.y + z * other.z
    }
    
    /// Calculate cross product
    public func cross(_ other: Vector3) -> Vector3 {
        return Vector3(
            x: y * other.z - z * other.y,
            y: z * other.x - x * other.z,
            z: x * other.y - y * other.x
        )
    }
}

// MARK: - Operators
extension Vector3 {
    public static func + (lhs: Vector3, rhs: Vector3) -> Vector3 {
        return Vector3(x: lhs.x + rhs.x, y: lhs.y + rhs.y, z: lhs.z + rhs.z)
    }
    
    public static func - (lhs: Vector3, rhs: Vector3) -> Vector3 {
        return Vector3(x: lhs.x - rhs.x, y: lhs.y - rhs.y, z: lhs.z - rhs.z)
    }
    
    public static func * (lhs: Vector3, rhs: Float) -> Vector3 {
        return Vector3(x: lhs.x * rhs, y: lhs.y * rhs, z: lhs.z * rhs)
    }
    
    public static func * (lhs: Float, rhs: Vector3) -> Vector3 {
        return Vector3(x: lhs * rhs.x, y: lhs * rhs.y, z: lhs * rhs.z)
    }
    
    public static func / (lhs: Vector3, rhs: Float) -> Vector3 {
        return Vector3(x: lhs.x / rhs, y: lhs.y / rhs, z: lhs.z / rhs)
    }
    
    public static func += (lhs: inout Vector3, rhs: Vector3) {
        lhs.x += rhs.x
        lhs.y += rhs.y
        lhs.z += rhs.z
    }
    
    public static func -= (lhs: inout Vector3, rhs: Vector3) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
        lhs.z -= rhs.z
    }
    
    public static func *= (lhs: inout Vector3, rhs: Float) {
        lhs.x *= rhs
        lhs.y *= rhs
        lhs.z *= rhs
    }
    
    public static func /= (lhs: inout Vector3, rhs: Float) {
        lhs.x /= rhs
        lhs.y /= rhs
        lhs.z /= rhs
    }
}
