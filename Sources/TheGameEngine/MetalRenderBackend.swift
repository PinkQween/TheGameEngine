//
//  MetalRenderBackend.swift
//  TheGameEngine
//
//  Created by Hanna Skairipa on 10/5/25.
//

#if os(macOS)
import Metal

public final class MetalRenderBackend: RenderBackend {
    private let device: MTLDevice
    private let commandQueue: MTLCommandQueue

    public init() {
        // If Metal is unavailable, crash with a clear error message.
        guard let dev = MTLCreateSystemDefaultDevice(),
              let queue = dev.makeCommandQueue() else {
            fatalError("❌ Metal is not supported on this machine.")
        }
        self.device = dev
        self.commandQueue = queue
    }

    public func upload(mesh: Mesh) {
        // Stub: real implementation would create MTLBuffers
        print("🔧 [Metal] Upload mesh: \(mesh.vertexCount) vertices, \(mesh.triangleCount) triangles")
    }

    public func draw(mesh: Mesh) {
        // Stub: real implementation would encode draw calls
        print("🎨 [Metal] Draw mesh")
    }

    public func shutdown() {
        print("🛑 [Metal] Shutdown")
    }
}
#endif
