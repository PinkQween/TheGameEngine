import Foundation

/// Transform component that handles position, rotation, and scale
public struct Transform: Codable {
    public var position: Vector3
    public var rotation: Vector3 // Euler angles in degrees
    public var scale: Vector3
    
    public init(position: Vector3 = Vector3.zero, rotation: Vector3 = Vector3.zero, scale: Vector3 = Vector3(x: 1, y: 1, z: 1)) {
        self.position = position
        self.rotation = rotation
        self.scale = scale
    }
    
    /// Translate by a given offset
    public mutating func translate(_ offset: Vector3) {
        position += offset
    }
    
    /// Rotate by given angles (in degrees)
    public mutating func rotate(_ angles: Vector3) {
        rotation += angles
        // Keep rotation values between 0 and 360 degrees
        rotation.x = fmod(rotation.x + 360, 360)
        rotation.y = fmod(rotation.y + 360, 360)
        rotation.z = fmod(rotation.z + 360, 360)
    }
    
    /// Scale uniformly
    public mutating func scaleUniform(_ factor: Float) {
        scale *= factor
    }
    
    /// Get forward direction based on current rotation
    public var forward: Vector3 {
        let radX = rotation.x * Float.pi / 180
        let radY = rotation.y * Float.pi / 180
        let radZ = rotation.z * Float.pi / 180
        
        return Vector3(
            x: cos(radY) * sin(radZ),
            y: -sin(radX),
            z: cos(radY) * cos(radZ)
        ).normalized
    }
    
    /// Get right direction based on current rotation
    public var right: Vector3 {
        return forward.cross(Vector3.up).normalized
    }
    
    /// Get up direction based on current rotation
    public var up: Vector3 {
        return right.cross(forward).normalized
    }
}
