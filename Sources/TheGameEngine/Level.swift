//
//  Level.swift
//  TheGameEngine
//
//  Created by Hanna Skairipa on 10/5/25.
//

public struct Level<Content: GameScene>: GameScene {
    let content: Content
    
    public init(@SceneBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: Content { content }
}
