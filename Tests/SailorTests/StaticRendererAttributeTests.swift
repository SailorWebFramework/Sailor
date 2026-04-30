// Tests/SailorTests/StaticRendererAttributeTests.swift
//
// Tests for StaticRenderer attribute ordering, escaping, and internal-attribute
// filtering (underscore / dot-prefixed attributes must be hidden from output).

import Foundation
import Sailor
import SailorServer
import Sailboat
import Testing

@MainActor @Suite("StaticRendererAttribute")
struct StaticRendererAttributeTests {

    let renderer = StaticRenderer()

    // MARK: - Alphabetical attribute ordering

    @Test("attributes are sorted alphabetically in rendered output")
    func alphabeticalOrder() {
        // "id" < "tabindex" < "title"
        let html = renderer.render(
            HTML.P { }
                .id("myid")
                .tabindex(3)
                .title("tooltip")
        )
        let idIdx      = html.range(of: "id=")!.lowerBound
        let tabIdx     = html.range(of: "tabindex=")!.lowerBound
        let titleIdx   = html.range(of: "title=")!.lowerBound
        #expect(idIdx < tabIdx)
        #expect(tabIdx < titleIdx)
    }

    // MARK: - HTML escaping in content

    @Test("< and > in text content are escaped to &lt; and &gt;")
    func contentEscapesAngleBrackets() {
        let html = renderer.render(HTML.P("<script>"))
        #expect(html == "<p>&lt;script&gt;</p>")
    }

    @Test("& in text content is escaped to &amp;")
    func contentEscapesAmpersand() {
        let html = renderer.render(HTML.P("a & b"))
        #expect(html == "<p>a &amp; b</p>")
    }

    @Test("double-quote in text content is escaped to &quot;")
    func contentEscapesQuote() {
        let html = renderer.render(HTML.P("say \"hello\""))
        #expect(html == "<p>say &quot;hello&quot;</p>")
    }

    @Test("double-quote in attribute value is escaped to &quot;")
    func attributeEscapesQuote2() {
        let html = renderer.render(HTML.P { }.title("say \"hello\""))
        #expect(html.contains("&quot;"))
    }

    // MARK: - HTML escaping in attribute values

    @Test("& in attribute value is escaped to &amp;")
    func attributeEscapesAmpersand() {
        let html = renderer.render(HTML.A(href: "search?q=a&b=2"))
        #expect(html.contains("&amp;"))
        #expect(!html.contains("q=a&b"))
    }

    // MARK: - Internal attributes filtered from output

    @Test("underscore-prefixed attributes are not rendered")
    func underscorePrefixHidden() {
        // .key() sets an "_key" attribute internally
        let html = renderer.render(HTML.P { }.key("loop-key"))
        #expect(!html.contains("_key"))
        #expect(!html.contains("loop-key"))
    }

    @Test("dot-prefixed attributes are not rendered")
    func dotPrefixHidden() {
        // HTML.Input.Text sets ".value" attribute for reactive binding
        let binding = Binding<String>(get: { "" }, set: { _ in }, id: 0)
        let html = renderer.render(HTML.Input.Text(binding))
        #expect(!html.contains(".value"))
    }
}
