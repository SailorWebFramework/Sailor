//
//  ServerManager.swift
//
//  Created by Sailor Codegen.
//

import Sailboat

/// A TargetManager for server-side rendering.
/// Builds the element tree using HTMLStringNode renderers, then renders to HTML.
@MainActor
public final class ServerManager: TargetManager {

    public init() {
        super.init(ServerEventScheduler())
    }

    /// Build the element tree and render it to an HTML string.
    public func renderToString(page: any Element) -> String {
        // Build the element tree (populates renderers via Renderable protocol)
        build(page: page)

        // The root element's renderer should be an HTMLStringNode
        guard let rootNode = page.renderer as? HTMLStringNode else {
            return ""
        }

        return rootNode.renderToString()
    }

    /// Render a full HTML document including <!DOCTYPE html>, head, and body.
    public func renderDocument(head: any Element, body: any Element) -> String {
        let headHTML = renderToString(page: head)
        let bodyHTML = renderToString(page: body)

        return """
        <!DOCTYPE html>
        <html>
        \(headHTML)
        \(bodyHTML)
        </html>
        """
    }
}
