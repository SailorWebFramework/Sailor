// Tests/SailorTests/BooleanAttributeTests.swift
//
// HTML boolean attributes (disabled, hidden, required, …) are true by presence.
// `.disabled(false)` must therefore *omit* the attribute — `disabled="false"`
// would still disable the element.

@_spi(Private) import Sailor
import Sailboat
import SailorServer
import SailorShared
import Testing

@MainActor @Suite("BooleanAttributes")
struct BooleanAttributeTests {

    let renderer = StaticRenderer()

    @Test("generated boolean attribute defaults to present and renders bare")
    func defaultPresent() {
        #expect(renderer.render(HTML.Button().disabled()) == "<button disabled></button>")
    }

    @Test("passing false omits the attribute entirely")
    func falseOmitted() {
        #expect(renderer.render(HTML.Button().disabled(false)) == "<button></button>")
    }

    @Test("global boolean attributes behave the same way")
    func globalBoolean() {
        #expect(renderer.render(HTML.Div().hidden()) == "<div hidden></div>")
        #expect(renderer.render(HTML.Div().hidden(false)) == "<div></div>")
        #expect(renderer.render(HTML.Div().inert()) == "<div inert></div>")
    }

    @Test("boolean attributes sort alongside valued attributes")
    func mixedAttributes() {
        let html = renderer.render(HTML.Div().id("bio").hidden())
        #expect(html == "<div hidden id=\"bio\"></div>")
    }

    @Test("BooleanAttribute closure value is BooleanAttribute, not Bool")
    func attributeValueType() {
        let value = HTML.Button().disabled().attributes["disabled"]?()
        #expect(value is BooleanAttribute)
        #expect((value as? BooleanAttribute)?.isPresent == true)
    }

    // MARK: - HTMLStringNode

    @Test("HTMLStringNode renders a present boolean attribute bare")
    func nodePresent() {
        let node = HTMLStringNode(named: "input")
        node.updateAttribute(name: "required", value: BooleanAttribute(true))
        #expect(node.renderToString() == "<input required />")
    }

    @Test("HTMLStringNode removes a boolean attribute when set to absent")
    func nodeRemoved() {
        let node = HTMLStringNode(named: "input")
        node.updateAttribute(name: "required", value: BooleanAttribute(true))
        node.updateAttribute(name: "required", value: BooleanAttribute(false))
        #expect(node.renderToString() == "<input />")
    }

    @Test("HTMLStringNode keeps valued attributes distinct from bare ones")
    func nodeMixed() {
        let node = HTMLStringNode(named: "input")
        node.updateAttribute(name: "name", value: "email")
        node.updateAttribute(name: "required", value: BooleanAttribute(true))
        node.updateAttribute(name: "alt", value: "")
        #expect(node.renderToString() == "<input name=\"email\" required alt=\"\" />")
    }

    // MARK: - data-*

    @Test("data(_:_:) emits data-<name>, not the literal data-name")
    func dataAttributeName() {
        #expect(renderer.render(HTML.Div().data("user-id", "42")) == "<div data-user-id=\"42\"></div>")
    }
}
