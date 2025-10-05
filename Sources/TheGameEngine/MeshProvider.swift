//
//  MeshProvider.swift
//  TheGameEngine
//
//  Created by Hanna Skairipa on 10/5/25.
//

/// Scenes that can provide a mesh for rendering implement this.
public protocol MeshProvider {
    var mesh: Mesh { get }
}
