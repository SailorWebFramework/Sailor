// Tests/SailorIntegrationTests/FixturePages.swift
//
// Fixture page builders for SSR snapshot tests.
// These produce deterministic element trees that the snapshots are written against.

import Sailor
import Sailboat

/// A library of small, self-contained pages used in SSR integration tests.
@MainActor
enum FixturePages {

    /// A single paragraph with literal text.
    static func helloWorld() -> HTML.P {
        HTML.P("Hello, World!")
    }

    /// A paragraph with an inline bold word.
    static func boldParagraph() -> HTML.P {
        HTML.P { HTML.B("important") }
    }

    /// An anchor tag with href and link text.
    static func link() -> HTML.A {
        HTML.A("Click here", href: "https://example.com")
    }

    /// A void img element with src.
    static func image() -> HTML.Img {
        HTML.Img(src: "photo.jpg")
    }

    /// A div containing two sibling paragraphs.
    static func siblingParagraphs() -> HTML.Div {
        HTML.Div {
            HTML.P("First")
            HTML.P("Second")
        }
    }

    /// A paragraph containing text with HTML-unsafe characters.
    static func htmlSpecialChars() -> HTML.P {
        HTML.P("a < b & c > d")
    }

    /// A paragraph whose text contains double-quotes.
    static func quotedText() -> HTML.P {
        HTML.P("say \"hi\"")
    }

    /// A full document: empty head + body with a single paragraph.
    static func document() -> (head: HTML.Head, body: HTML.Body) {
        (
            head: HTML.Head(),
            body: HTML.Body { HTML.P("Hello") }
        )
    }

    /// A richer document with a title in the head and nested content in the body.
    static func richDocument() -> (head: HTML.Head, body: HTML.Body) {
        (
            head: HTML.Head(),
            body: HTML.Body {
                HTML.Div {
                    HTML.P("Welcome")
                    HTML.A("Home", href: "/")
                }
            }
        )
    }
}
