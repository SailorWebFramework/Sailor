//
//  HTMLTextNode.swift
//
//  Created by Sailor Codegen.
//

import Sailboat
import SailorShared

/// Renders text content as an HTML string (analogous to StringRenderer for JSNode).
@MainActor
public struct HTMLTextNode: Renderable, HTMLStringRenderable {

    public var sailboatID: SailboatID? = nil

    public let value: String

    nonisolated public init(_ value: String) {
        self.value = value
    }

    // MARK: - HTMLStringRenderable

    public func renderToString() -> String {
        escapeHTML(value)
    }

    // MARK: - Renderable (mostly no-ops for text nodes)

    public func addToParent(_ parent: any Renderable) {
        guard let parentNode = parent as? HTMLStringNode else { return }
        parentNode.appendContent(text: self.value)
    }

    public func setSailboatID(_ value: SailboatID?) { }
    public func remove() { }
    public func remove(at deepIndex: Int) { }
    public func updateAttribute(name: String, value: any AttributeValue) { }
    public func addEvent(name: String, value: @escaping (EventResult) -> Void) { }
    public func insertAfter(_ deepIndex: Int, parent: any Renderable) { }
    public func insertBefore(_ deepIndex: Int, parent: any Renderable) { }
    public func replace(at: Int, with: any Renderable) { }

    // MARK: - Private

    private func escapeHTML(_ string: String) -> String {
        var result = ""
        result.reserveCapacity(string.count)
        for char in string {
            switch char {
            case "&": result += "&amp;"
            case "<": result += "&lt;"
            case ">": result += "&gt;"
            default: result.append(char)
            }
        }
        return result
    }
}
