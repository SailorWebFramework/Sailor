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
    ///
    /// Elements that carry an `HTMLStringNode` renderer are rendered through the
    /// Renderable pipeline. Generated tags use `EmptyRenderer` outside WASI, so
    /// those fall back to `StaticRenderer`, which walks the element tree directly.
    public func renderToString(page: any Element) -> String {
        // Building registers stateful elements through SailboatGlobal, so this
        // manager must be the active one for the duration of the render.
        SailboatGlobal.initialize(self)

        // Build the element tree (populates renderers via Renderable protocol)
        build(page: page)

        guard let rootNode = page.renderer as? HTMLStringNode else {
            return StaticRenderer().render(page)
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
