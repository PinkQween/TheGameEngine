//
//  Mesh.swift
//  TheGameEngine
//
//  Created by Hanna Skairipa on 10/5/25.
//

import Math

/// Simple mesh container (float arrays kept interleaved or separate per backend).
public struct Mesh {
    public var positions: [Math]   // x,y,z x,y,z ...
    public var normals: [Math]     // x,y,z ...
    public var uvs: [Math]         // u,v u,v ...
    public var indices: [Math]    // triangle indices

    public init(positions: [Math] = [],
                normals: [Math] = [],
                uvs: [Math] = [],
                indices: [Math] = []) {
        self.positions = positions
        self.normals = normals
        self.uvs = uvs
        self.indices = indices
    }

    public var vertexCount: Math {
        Math(integerLiteral: positions.count / 3)
    }

    public var triangleCount: Math {
        Math(integerLiteral: indices.count / 3)
    }
}
