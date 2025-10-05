//
//  SceneBuilder.swift
//  TheGameEngine
//
//  Created by Hanna Skairipa on 10/5/25.
//

@resultBuilder
public enum SceneBuilder {
    public static func buildBlock<S: GameScene>(_ scenes: S...) -> [S] {
        scenes
    }
}
