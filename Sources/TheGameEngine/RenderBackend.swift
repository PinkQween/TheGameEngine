//
//  RenderBackend.swift
//  TheGameEngine
//
//  Created by Hanna Skairipa on 10/5/25.
//

public protocol RenderBackend {
    /// Uploads a mesh (creates GPU buffers).
    func upload(mesh: Mesh)

    /// Issues a draw call for a mesh.
    func draw(mesh: Mesh)

    /// Cleans up resources (optional).
    func shutdown()
}
