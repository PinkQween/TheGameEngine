// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TheGameEngine",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "TheGameEngine",
            targets: ["TheGameEngine"]
        ),
        .executable(
            name: "GameEngineDemo",
            targets: ["GameEngineDemo"]
        )
    ],
    dependencies: [
        // Add external dependencies here if needed
        // .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "TheGameEngine",
            dependencies: [],
            path: "Sources/TheGameEngine",
            publicHeadersPath: "include"
        ),
        .executableTarget(
            name: "GameEngineDemo",
            dependencies: ["TheGameEngine"],
            path: "Sources/GameEngineDemo"
        ),
        .testTarget(
            name: "TheGameEngineTests",
            dependencies: ["TheGameEngine"],
            path: "Tests/TheGameEngineTests"
        )
    ]
)
