// Tests/SailorTests/GeneratedTagTests.swift
//
// Verifies the Shipwright-generated HTML element structs expose the correct
// static metadata and produce the right rendered output.

@_spi(Private) import Sailor
import SailorServer
import Sailboat
import Testing

@MainActor @Suite("GeneratedTag")
struct GeneratedTagTests {

    let renderer = StaticRenderer()

    // MARK: - Static tag names

    @Test("HTML.P.name is 'p'")
    func pTagName() {
        #expect(HTML.P.name == "p")
    }

    @Test("HTML.A.name is 'a'")
    func aTagName() {
        #expect(HTML.A.name == "a")
    }

    @Test("HTML.Img.name is 'img'")
    func imgTagName() {
        #expect(HTML.Img.name == "img")
    }

    @Test("HTML.Input.name is 'input'")
    func inputTagName() {
        #expect(HTML.Input.name == "input")
    }

    @Test("HTML.B.name is 'b'")
    func bTagName() {
        #expect(HTML.B.name == "b")
    }

    // MARK: - Text init produces renderable output

    @Test("HTML.P text init renders content")
    func pTextInit() {
        let html = renderer.render(HTML.P("hello"))
        #expect(html == "<p>hello</p>")
    }

    @Test("HTML.B text init renders content")
    func bTextInit() {
        let html = renderer.render(HTML.B("bold"))
        #expect(html == "<b>bold</b>")
    }

    // MARK: - Global attributes

    @Test("HTML.P empty content init renders empty element")
    func pEmptyInit() {
        let html = renderer.render(HTML.P { })
        #expect(html == "<p></p>")
    }

    @Test("lang attribute appears in rendered output")
    func langAttribute() {
        let html = renderer.render(HTML.P { }.lang(.en))
        #expect(html.contains("lang=\"en\""))
    }

    @Test("id attribute appears in rendered output")
    func idAttribute() {
        let html = renderer.render(HTML.P { }.id("my-id"))
        #expect(html.contains("id=\"my-id\""))
    }

    // MARK: - Specific inits

    @Test("HTML.A href init sets href in rendered output")
    func aHrefInit() {
        let html = renderer.render(HTML.A(href: "https://example.com"))
        #expect(html.contains("href=\"https://example.com\""))
    }

    @Test("HTML.A text+href init renders both text and href")
    func aTextAndHref() {
        let html = renderer.render(HTML.A("click me", href: "https://example.com"))
        #expect(html.contains("click me"))
        #expect(html.contains("href=\"https://example.com\""))
    }

    @Test("HTML.Img renders as void element (self-closing)")
    func imgVoid() {
        let html = renderer.render(HTML.Img())
        #expect(html == "<img />")
    }

    @Test("HTML.Img src init sets src attribute")
    func imgSrc() {
        let html = renderer.render(HTML.Img(src: "photo.png"))
        #expect(html.contains("src=\"photo.png\""))
        #expect(html.hasSuffix("/>"))
    }

    // MARK: - Binding-based Input inits

    @Test("HTML.Input.Text sets type=text in rendered output")
    func inputTextType() {
        let binding = Binding<String>(get: { "value" }, set: { _ in }, id: 1)
        let html = renderer.render(HTML.Input.Text(binding))
        #expect(html.contains("type=\"text\""))
    }

    @Test("HTML.Input.Checkbox sets type=checkbox in rendered output")
    func inputCheckboxType() {
        let binding = Binding<Bool>(get: { false }, set: { _ in }, id: 2)
        let html = renderer.render(HTML.Input.Checkbox(binding))
        #expect(html.contains("type=\"checkbox\""))
    }
}
