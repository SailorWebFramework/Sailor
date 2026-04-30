// Tests/SailorIntegrationTests/SSRSnapshotTests.swift
//
// End-to-end SSR snapshot tests.
// Each test calls StaticRenderer.render() on a fixture page and asserts that
// the output matches a known-good inline snapshot.

import Sailor
import SailorServer
import Sailboat
import Testing

@MainActor @Suite("SSR Snapshot")
struct SSRSnapshotTests {

    let renderer = StaticRenderer()

    // MARK: - Simple elements

    @Test("simple paragraph snapshot")
    func simpleParagraph() {
        #expect(
            renderer.render(FixturePages.helloWorld())
            == "<p>Hello, World!</p>"
        )
    }

    @Test("bold paragraph snapshot")
    func boldParagraph() {
        #expect(
            renderer.render(FixturePages.boldParagraph())
            == "<p><b>important</b></p>"
        )
    }

    @Test("anchor with text and href snapshot")
    func anchorLink() {
        #expect(
            renderer.render(FixturePages.link())
            == "<a href=\"https://example.com\">Click here</a>"
        )
    }

    @Test("void img with src snapshot")
    func imageVoid() {
        #expect(
            renderer.render(FixturePages.image())
            == "<img src=\"photo.jpg\" />"
        )
    }

    @Test("div with two sibling paragraphs snapshot")
    func siblingParagraphs() {
        #expect(
            renderer.render(FixturePages.siblingParagraphs())
            == "<div><p>First</p><p>Second</p></div>"
        )
    }

    // MARK: - HTML escaping

    @Test("angle brackets and ampersand are escaped in text content")
    func htmlSpecialChars() {
        #expect(
            renderer.render(FixturePages.htmlSpecialChars())
            == "<p>a &lt; b &amp; c &gt; d</p>"
        )
    }

    @Test("double-quotes are escaped in text content")
    func quotedText() {
        #expect(
            renderer.render(FixturePages.quotedText())
            == "<p>say &quot;hi&quot;</p>"
        )
    }

    // MARK: - Full documents

    @Test("minimal document snapshot")
    func minimalDocument() {
        let pages = FixturePages.document()
        let html = renderer.renderDocument(head: pages.head, body: pages.body)
        let expected = "<!DOCTYPE html>\n<html>\n<head></head>\n<body><p>Hello</p></body>\n</html>"
        #expect(html == expected)
    }

    @Test("richer document has correct structure")
    func richDocument() {
        let pages = FixturePages.richDocument()
        let html = renderer.renderDocument(head: pages.head, body: pages.body)
        #expect(html.hasPrefix("<!DOCTYPE html>"))
        #expect(html.contains("<div>"))
        #expect(html.contains("<p>Welcome</p>"))
        #expect(html.contains("<a href=\"/\">Home</a>"))
    }

    // MARK: - Determinism

    @Test("rendering the same fixture twice produces identical output")
    func deterministicOutput() {
        let first  = renderer.render(FixturePages.boldParagraph())
        let second = renderer.render(FixturePages.boldParagraph())
        #expect(first == second)
    }
}
