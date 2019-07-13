//
//  SCNArrow.swift
//  Pods
//
//  Created by Eric Internicola on 7/13/19.
//

import SceneKit

open class SCNArrow: SCNNode {

    public static var defaultMaterials: [SCNMaterial] {
        let material = SCNMaterial()
        #if os(iOS)
        material.diffuse.contents = UIColor.red
        #elseif os(OSX)
        material.diffuse.contents = NSColor.red
        #endif

        return [material]
    }

    public convenience init(size: CGFloat, materials: [SCNMaterial] = SCNArrow.defaultMaterials) {
        self.init()
        addChildNode(buildCylinder(size: size, materials: materials))
        addChildNode(buildCone(size: size, materials: materials))
    }

}

// MARK: - Implementation

private extension SCNArrow {

    /// Builds the cone portion of the arrow.
    ///
    /// - Parameters:
    ///   - size: The size of the cone.
    ///   - materials: The materials to set on the cone.
    /// - Returns: The SCNNode that contains the cone geometry.
    func buildCone(size: CGFloat, materials: [SCNMaterial] = SCNArrow.defaultMaterials) -> SCNNode {
        let cone = SCNCone(topRadius: 0, bottomRadius: size / 2, height: size)
        cone.materials = materials
        let node = SCNNode(geometry: cone)
        node.position = SCNVector3(0, size, 0)

        return node
    }

    /// Builds you a cylinder for this arrow.
    ///
    /// - Parameters:
    ///   - size: The size of the cylinder (radius = size / 2, height = size)
    ///   - materials: The materials to set on the arrow.
    /// - Returns: The SCNNode that contains the cylinder geometry.
    func buildCylinder(size: CGFloat, materials: [SCNMaterial] = SCNArrow.defaultMaterials) -> SCNNode {
        let cylinder = SCNCylinder(radius: size / 4, height: size)
        cylinder.materials = materials
        let node = SCNNode(geometry: cylinder)

        return node
    }

}
