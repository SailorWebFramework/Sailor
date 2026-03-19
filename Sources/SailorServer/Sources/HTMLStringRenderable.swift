//
//  HTMLStringRenderable.swift
//
//  Created by Sailor Codegen.
//

/// Protocol for nodes that can render themselves to HTML strings
@MainActor
public protocol HTMLStringRenderable {
    func renderToString() -> String
}
