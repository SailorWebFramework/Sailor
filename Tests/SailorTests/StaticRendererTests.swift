// Tests/SailorTests/StaticRendererTests.swift
//
// Verifies StaticRenderer produces correct HTML for common element shapes.
// StaticRenderer is pure — no SailboatGlobal.manager required.

import Sailor
import SailorServer
import Sailboat
import Testing

@MainActor @Suite("StaticRenderer")
struct StaticRendererTests {

    let renderer = StaticRenderer()

    // MARK: - Basic elements

    @Test("empty p renders as <p></p>")
    func emptyP() {
        #expect(renderer.render(HTML.P { }) == "<p></p>")
    }

    @Test("p with text renders text inside tags")
    func pWithText() {
        #expect(renderer.render(HTML.P("hello")) == "<p>hello</p>")
    }

    @Test("empty div renders as <div></div>")
    func emptyDiv() {
        #expect(renderer.render(HTML.Div { }) == "<div></div>")
    }

    // MARK: - Void elements

    @Test("img is self-closing: <img />")
    func imgSelfClosing() {
        #expect(renderer.render(HTML.Img()) == "<img />")
    }

    @Test("br is self-closing: <br />")
    func brSelfClosing() {
        #expect(renderer.render(HTML.Br()) == "<br />")
    }

    // MARK: - Attributes

    @Test("a with href produces href attribute")
    func aWithHref() {
        let html = renderer.render(HTML.A(href: "https://example.com"))
        #expect(html == "<a href=\"https://example.com\"></a>")
    }

    @Test("img with src renders src on void element")
    func imgWithSrc() {
        let html = renderer.render(HTML.Img(src: "logo.png"))
        #expect(html == "<img src=\"logo.png\" />")
    }

    // MARK: - Nesting

    @Test("nested b inside p renders correctly")
    func nestedBInP() {
        let html = renderer.render(HTML.P { HTML.B("bold") })
        #expect(html == "<p><b>bold</b></p>")
    }

    @Test("sibling elements inside div render in order")
    func siblingElements() {
        let html = renderer.render(HTML.Div {
            HTML.P("first")
            HTML.P("second")
        })
        #expect(html == "<div><p>first</p><p>second</p></div>")
    }

    @Test("three levels of nesting render correctly")
    func deepNesting() {
        let html = renderer.render(HTML.Div {
            HTML.P {
                HTML.B("deep")
            }
        })
        #expect(html == "<div><p><b>deep</b></p></div>")
    }

    // MARK: - String text nodes

    @Test("string text node escapes HTML-unsafe characters")
    func stringTextNodeEscaped() {
        let html = renderer.render(HTML.P("<em>"))
        #expect(html == "<p>&lt;em&gt;</p>")
    }

    // MARK: - renderDocument

    @Test("renderDocument starts with <!DOCTYPE html>")
    func documentDoctype() {
        let html = renderer.renderDocument(head: HTML.Head(), body: HTML.Body { })
        #expect(html.hasPrefix("<!DOCTYPE html>"))
    }

    @Test("renderDocument wraps content in <html></html>")
    func documentHtmlWrapper() {
        let html = renderer.renderDocument(head: HTML.Head(), body: HTML.Body { })
        #expect(html.contains("<html>"))
        #expect(html.contains("</html>"))
    }

    @Test("renderDocument produces full document structure")
    func documentFullStructure() {
        let html = renderer.renderDocument(head: HTML.Head(), body: HTML.Body { })
        let expected = "<!DOCTYPE html>\n<html>\n<head></head>\n<body></body>\n</html>"
        #expect(html == expected)
    }

    @Test("renderDocument includes body content")
    func documentBodyContent() {
        let html = renderer.renderDocument(
            head: HTML.Head(),
            body: HTML.Body { HTML.P("Hello") }
        )
        #expect(html.contains("<p>Hello</p>"))
    }
}
