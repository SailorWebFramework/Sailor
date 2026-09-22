// Tests/SailorTests/HTMLStringNodeTests.swift
//
// Unit tests for the Renderable-backed SSR nodes (HTMLStringNode / HTMLTextNode):
// tree mutation through the Renderable protocol and HTML string output.

import Sailboat
import SailorShared
@testable import SailorServer
import Testing

@MainActor @Suite("HTMLStringNode")
struct HTMLStringNodeTests {

    // MARK: - Rendering

    @Test("empty element renders open and close tags")
    func emptyElement() {
        #expect(HTMLStringNode(named: "div").renderToString() == "<div></div>")
    }

    @Test("void element with no children is self-closing")
    func voidElement() {
        #expect(HTMLStringNode(named: "br").renderToString() == "<br />")
        #expect(HTMLStringNode(named: "img").renderToString() == "<img />")
    }

    @Test("text children render in insertion order")
    func textChildren() {
        let p = HTMLStringNode(named: "p")
        p.appendContent(text: "a")
        p.appendContent(text: "b")
        #expect(p.renderToString() == "<p>ab</p>")
    }

    @Test("HTMLTextNode.addToParent appends escaped text")
    func textNodeAddToParent() {
        let p = HTMLStringNode(named: "p")
        HTMLTextNode("<x>").addToParent(p)
        #expect(p.renderToString() == "<p>&lt;x&gt;</p>")
    }

    @Test("text nodes escape & < > and leave quotes as-is")
    func textNodeEscaping() {
        #expect(HTMLTextNode("\"a\" & <b>").renderToString() == "\"a\" &amp; &lt;b&gt;")
    }

    // MARK: - Attributes

    @Test("updateAttribute appends attributes in insertion order")
    func attributeOrder() {
        let div = HTMLStringNode(named: "div")
        div.updateAttribute(name: "id", value: "x")
        div.updateAttribute(name: "class", value: "y")
        #expect(div.renderToString() == "<div id=\"x\" class=\"y\"></div>")
    }

    @Test("updateAttribute replaces an existing attribute in place")
    func attributeReplace() {
        let div = HTMLStringNode(named: "div")
        div.updateAttribute(name: "id", value: "x")
        div.updateAttribute(name: "class", value: "y")
        div.updateAttribute(name: "id", value: "z")
        #expect(div.renderToString() == "<div id=\"z\" class=\"y\"></div>")
    }

    @Test("internal (_) and JS passthrough (.) attributes are ignored")
    func internalAttributesIgnored() {
        let div = HTMLStringNode(named: "div")
        div.updateAttribute(name: "_key", value: "k")
        div.updateAttribute(name: ".value", value: "v")
        #expect(div.renderToString() == "<div></div>")
    }

    @Test("attribute values are HTML-escaped")
    func attributeEscaping() {
        let div = HTMLStringNode(named: "div")
        div.updateAttribute(name: "title", value: "a&b\"<c>")
        #expect(div.renderToString() == "<div title=\"a&amp;b&quot;&lt;c&gt;\"></div>")
    }

    @Test("setSailboatID keeps the id in Swift and out of the markup")
    func sailboatIDAttribute() {
        let div = HTMLStringNode(named: "div")
        div.setSailboatID(42)
        #expect(div.sailboatID == 42)
        #expect(div.renderToString() == "<div></div>")
    }

    @Test("setSailboatID(nil) clears the id")
    func sailboatIDNil() {
        let div = HTMLStringNode(named: "div")
        div.setSailboatID(nil)
        #expect(div.sailboatID == nil)
        #expect(div.renderToString() == "<div></div>")
    }

    @Test("addEvent is a no-op for SSR output")
    func addEventNoOp() {
        let div = HTMLStringNode(named: "div")
        div.addEvent(name: "click") { _ in }
        #expect(div.renderToString() == "<div></div>")
    }

    // MARK: - Tree mutation

    private func parentWith(_ tags: String...) -> HTMLStringNode {
        let parent = HTMLStringNode(named: "div")
        for tag in tags { HTMLStringNode(named: tag).addToParent(parent) }
        return parent
    }

    @Test("addToParent appends and records the parent")
    func addToParent() {
        let parent = parentWith("a")
        let b = HTMLStringNode(named: "b")
        b.addToParent(parent)
        #expect(parent.renderToString() == "<div><a></a><b></b></div>")
        #expect(b.parent === parent)
    }

    @Test("insertBefore(0) prepends")
    func insertBeforeStart() {
        let parent = parentWith("a")
        HTMLStringNode(named: "b").insertBefore(0, parent: parent)
        #expect(parent.renderToString() == "<div><b></b><a></a></div>")
    }

    @Test("insertBefore past the end clamps to append")
    func insertBeforeClamps() {
        let parent = parentWith("a")
        HTMLStringNode(named: "b").insertBefore(99, parent: parent)
        #expect(parent.renderToString() == "<div><a></a><b></b></div>")
    }

    @Test("insertAfter(0) inserts after the first child")
    func insertAfterFirst() {
        let parent = parentWith("a", "c")
        HTMLStringNode(named: "b").insertAfter(0, parent: parent)
        #expect(parent.renderToString() == "<div><a></a><b></b><c></c></div>")
    }

    @Test("insertAfter past the end clamps to append")
    func insertAfterClamps() {
        let parent = parentWith("a")
        HTMLStringNode(named: "b").insertAfter(99, parent: parent)
        #expect(parent.renderToString() == "<div><a></a><b></b></div>")
    }

    @Test("remove() detaches the node from its parent")
    func removeDetaches() {
        let parent = HTMLStringNode(named: "div")
        let a = HTMLStringNode(named: "a")
        a.addToParent(parent)
        HTMLStringNode(named: "b").addToParent(parent)
        a.remove()
        #expect(parent.renderToString() == "<div><b></b></div>")
    }

    @Test("remove() on a detached node is a no-op")
    func removeDetachedNoOp() {
        let orphan = HTMLStringNode(named: "a")
        orphan.remove()
        #expect(orphan.renderToString() == "<a></a>")
    }

    @Test("replace(at:) swaps in a text node")
    func replaceWithText() {
        let parent = parentWith("a")
        parent.replace(at: 0, with: HTMLTextNode("hi"))
        #expect(parent.renderToString() == "<div>hi</div>")
    }

    @Test("replace(at:) swaps in an element node and reparents it")
    func replaceWithElement() {
        let parent = parentWith("a")
        let b = HTMLStringNode(named: "b")
        parent.replace(at: 0, with: b)
        #expect(parent.renderToString() == "<div><b></b></div>")
        #expect(b.parent === parent)
        b.remove()
        #expect(parent.renderToString() == "<div></div>")
    }

    @Test("replace(at:) out of range is a no-op")
    func replaceOutOfRange() {
        let parent = parentWith("a")
        parent.replace(at: 3, with: HTMLTextNode("x"))
        #expect(parent.renderToString() == "<div><a></a></div>")
    }

    @Test("nested nodes render recursively")
    func nestedRender() {
        let section = HTMLStringNode(named: "section")
        let article = HTMLStringNode(named: "article")
        article.addToParent(section)
        HTMLTextNode("body").addToParent(article)
        #expect(section.renderToString() == "<section><article>body</article></section>")
    }
}
