//
//  LinuxRenderBackend.swift
//  TheGameEngine
//
//  Created by Hanna Skairipa on 10/5/25.
//

#if os(Linux)
import Glibc

public final class LinuxRenderBackend: RenderBackend {
    public init() {
        // Could init OpenGL/Vulkan context here
        print("✅ [Linux] Render backend initialized")
    }

    public func upload(mesh: Mesh) {
        // Stub: would create VBO/VAO (OpenGL) or VkBuffer (Vulkan)
        print("🔧 [Linux] Upload mesh: \(mesh.vertexCount) vertices, \(mesh.triangleCount) triangles")
    }

    public func draw(mesh: Mesh) {
        // Stub: would glDrawElements or vkCmdDrawIndexed
        print("🎨 [Linux] Draw mesh")
    }

    public func shutdown() {
        print("🛑 [Linux] Shutdown")
    }
}
#endif
