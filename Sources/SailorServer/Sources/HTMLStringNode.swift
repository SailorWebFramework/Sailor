//
//  HTMLStringNode.swift
//
//  Created by Sailor Codegen.
//

import Sailboat
import SailorShared

/// A Renderable implementation that builds HTML strings instead of DOM nodes.
/// Used for server-side rendering (SSR) and static site generation (SSG).
@MainActor
public final class HTMLStringNode: Renderable {

    public var sailboatID: SailboatID?

    /// The HTML tag name (e.g. "div", "span", "a")
    public let tagName: String

    /// Attributes collected via updateAttribute
    internal var attributes: [(String, String)] = []

    /// Ordered child nodes (elements and text nodes)
    internal var children: [any HTMLStringRenderable] = []

    /// Weak reference to parent for removal
    internal weak var parent: HTMLStringNode?

    public init(named tagName: String) {
        self.tagName = tagName
    }

    // MARK: - Renderable

    public func addToParent(_ parent: any Renderable) {
        guard let parentNode = parent as? HTMLStringNode else { return }
        self.parent = parentNode
        parentNode.children.append(self)
    }

    public func insertBefore(_ deepIndex: Int, parent: any Renderable) {
        guard let parentNode = parent as? HTMLStringNode else { return }
        self.parent = parentNode
        let index = min(deepIndex, parentNode.children.count)
        parentNode.children.insert(self, at: index)
    }

    public func insertAfter(_ deepIndex: Int, parent: any Renderable) {
        guard let parentNode = parent as? HTMLStringNode else { return }
        self.parent = parentNode
        let index = min(deepIndex + 1, parentNode.children.count)
        parentNode.children.insert(self, at: index)
    }

    public func remove() {
        guard let parent = self.parent else { return }
        parent.children.removeAll { ($0 as AnyObject) === self }
    }

    public func remove(at deepIndex: Int) {
        guard deepIndex < children.count else { return }
        children.remove(at: deepIndex)
    }

    public func replace(at deepIndex: Int, with renderer: any Renderable) {
        guard deepIndex < children.count else { return }
        if let textNode = renderer as? HTMLTextNode {
            children[deepIndex] = textNode
        } else if let elementNode = renderer as? HTMLStringNode {
            elementNode.parent = self
            children[deepIndex] = elementNode
        }
    }

    public func updateAttribute(name: String, value: any AttributeValue) {
        // Skip internal Sailor attributes
        if name.first == "_" { return }

        // Skip JS property-passthrough attributes (not applicable in SSR)
        if name.first == "." { return }

        // Update existing or append new
        if let index = attributes.firstIndex(where: { $0.0 == name }) {
            attributes[index] = (name, value.description)
        } else {
            attributes.append((name, value.description))
        }
    }

    public func addEvent(name: String, value: @escaping (EventResult) -> Void) {
        // Events are not applicable in SSR — no-op
    }

    public func setSailboatID(_ value: SailboatID?) {
        self.sailboatID = value
        if let sid = value {
            updateAttribute(name: "data-sid", value: sid)
        }
    }

    /// Appends a text node as a child
    internal func appendContent(text: String) {
        children.append(HTMLTextNode(text))
    }
}

// MARK: - HTML String Rendering

extension HTMLStringNode: HTMLStringRenderable {

    /// Render this node and all children to an HTML string
    public func renderToString() -> String {
        var html = "<\(tagName)"

        // Render attributes
        for (name, value) in attributes {
            html += " \(name)=\"\(escapeHTML(value))\""
        }

        // Self-closing tags
        if Self.voidElements.contains(tagName) && children.isEmpty {
            html += " />"
            return html
        }

        html += ">"

        // Render children
        for child in children {
            html += child.renderToString()
        }

        html += "</\(tagName)>"
        return html
    }

    /// HTML void elements that cannot have children
    private static let voidElements: Set<String> = [
        "area", "base", "br", "col", "embed", "hr", "img", "input",
        "link", "meta", "param", "source", "track", "wbr"
    ]

    /// Escape special HTML characters in attribute values
    private func escapeHTML(_ string: String) -> String {
        var result = ""
        result.reserveCapacity(string.count)
        for char in string {
            switch char {
            case "&": result += "&amp;"
            case "\"": result += "&quot;"
            case "<": result += "&lt;"
            case ">": result += "&gt;"
            default: result.append(char)
            }
        }
        return result
    }
}
