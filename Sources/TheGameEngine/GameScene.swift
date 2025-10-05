//
//  GameScene.swift
//  TheGameEngine
//
//  Created by Hanna Skairipa on 10/5/25.
//

public protocol GameScene {
    associatedtype Body: GameScene
    var body: Body { get }
}

/// Empty scene for convenience
public struct EmptyScene: GameScene {
    public init() {}
    public var body: EmptyScene { self }
}
