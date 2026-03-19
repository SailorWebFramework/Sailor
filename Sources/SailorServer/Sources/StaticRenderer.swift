//
//  StaticRenderer.swift
//
//  Created by Sailor Codegen.
//

import Sailor
import Sailboat
import SailorShared

/// Renders Sailor element trees to HTML strings by walking the tree directly.
/// This approach works without modifying generated code — it reads Element properties
/// (tag name, attributes, content) and produces HTML without the Renderable pipeline.
@MainActor
public struct StaticRenderer {

    public init() {}

    /// Render any Page to an HTML string
    public func render(_ page: any Page) -> String {
        if let element = page as? any Element {
            return renderElement(element)
        } else if let fragment = page as? any Fragment {
            return renderFragment(fragment)
        } else if let valueElement = page as? any ValueElement {
            return escapeHTML(valueElement.value.description)
        } else {
            // Generic Page — render its body
            return render(page.body)
        }
    }

    /// Render a full HTML document
    public func renderDocument(head: any Page, body: any Page) -> String {
        let headHTML = render(head)
        let bodyHTML = render(body)
        return "<!DOCTYPE html>\n<html>\n\(headHTML)\n\(bodyHTML)\n</html>"
    }

    // MARK: - Private

    /// Render an Element (has tag name, attributes, content)
    private func renderElement(_ element: any Element) -> String {
        let tagName = Self.extractTagName(from: element)

        var html = "<\(tagName)"

        // Render attributes — sorted for deterministic output
        let sortedAttrs = element.attributes.sorted(by: { $0.key < $1.key })
        for (name, valueBuilder) in sortedAttrs {
            // Skip internal attributes
            if name.first == "_" || name.first == "." { continue }
            let value = valueBuilder()
            html += " \(name)=\"\(escapeHTML(value.description))\""
        }

        // Self-closing tags
        if Self.voidElements.contains(tagName) {
            html += " />"
            return html
        }

        html += ">"

        // Render content (children)
        let content = element.content()
        html += renderFragment(content)

        html += "</\(tagName)>"
        return html
    }

    /// Render a Fragment (virtual container with children)
    private func renderFragment(_ fragment: any Fragment) -> String {
        var html = ""
        for child in fragment.children {
            html += render(child)
        }
        return html
    }

    /// Extract the HTML tag name from an Element.
    /// The generated structs follow the pattern HTML.TagName where TagName.lowercased() == html tag.
    private static func extractTagName(from element: any Element) -> String {
        let fullName = String(describing: type(of: element))
        return fullName.lowercased()
    }

    /// Escape HTML special characters
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

    /// HTML void elements that cannot have children
    private static let voidElements: Set<String> = [
        "area", "base", "br", "col", "embed", "hr", "img", "input",
        "link", "meta", "param", "source", "track", "wbr"
    ]
}
