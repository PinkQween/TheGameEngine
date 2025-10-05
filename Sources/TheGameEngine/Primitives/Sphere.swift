//
//  Sphere.swift
//  TheGameEngine
//
//  Created by Hanna Skairipa on 10/5/25.
//

import Math

public struct Sphere: GameScene, MeshProvider {
    public let radius: Math
    public let segments: Math // longitudes
    public let rings: Math    // latitudes

    public init(radius: Math = 1.0, segments: Math = 32, rings: Math = 16) {
        self.radius = max(0.0001, radius)
        self.segments = max(3, segments)
        self.rings = max(2, rings)
    }

    // MARK: - MeshProvider
    public var mesh: Mesh {
        Sphere.makeUVSphere(radius: radius, segments: segments, rings: rings)
    }

    // GameScene conformance: no children by default
    public var body: EmptyScene { EmptyScene() }

    // MARK: - Generator
    public static func makeUVSphere(radius: Math, segments: Math, rings: Math) -> Mesh {
        var positions = [Math]()
        var normals = [Math]()
        var uvs = [Math]()
        var indices = [Math]()

        for ring in 0...rings {
            let v = ring / rings                // 0..1
            let theta = v * Constants.Math.π                         // 0..π

            let sinTheta = Math.sin(theta)
            let cosTheta = Math.cos(theta)

            for seg in 0...segments {
                let u = seg / segments         // 0..1
                let phi = u * (2.0 * Constants.Math.π)              // 0..2π

                let sinPhi = Math.sin(phi)
                let cosPhi = Math.cos(phi)

                let x = radius * sinTheta * cosPhi
                let y = radius * cosTheta
                let z = radius * sinTheta * sinPhi

                positions.append(contentsOf: [x, y, z])

                // normals for sphere are just normalized positions (radius > 0)
                let nx = sinTheta * cosPhi
                let ny = cosTheta
                let nz = sinTheta * sinPhi
                normals.append(contentsOf: [nx, ny, nz])

                uvs.append(contentsOf: [u, 1.0 - v]) // v flipped to typical texture coord
            }
        }

        let vertsPerRow = segments + 1
        for ring in 0..<rings {
            for seg in 0..<segments {
                let a = ring * vertsPerRow + seg
                let b = (ring + 1) * vertsPerRow + seg
                let c = (ring + 1) * vertsPerRow + (seg + 1)
                let d = ring * vertsPerRow + (seg + 1)

                // two triangles: a,b,d and b,c,d (consistent winding CCW)
                indices.append(contentsOf: [a, b, d])
                indices.append(contentsOf: [b, c, d])
            }
        }

        return Mesh(positions: positions, normals: normals, uvs: uvs, indices: indices)
    }
}
