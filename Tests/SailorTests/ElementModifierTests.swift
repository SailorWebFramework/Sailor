// Tests/SailorTests/ElementModifierTests.swift
//
// Element modifiers: style/classes/key attributes, lifecycle + DOM events,
// Page-level forwarding, and globalStore.

@_spi(Private) import Sailor
import Sailboat
import SailorServer
import SailorShared
import Testing

@MainActor
private struct Wrapper: Page {
    var body: some Page { HTML.Div() }
}

private final class Theme { }

@MainActor @Suite("ElementModifiers")
struct ElementModifierTests {

    let renderer = StaticRenderer()

    // MARK: - Attributes

    @Test("style {} sets the style attribute from the StyleBuilder")
    func styleAttribute() {
        let div = HTML.Div().style { CSS.accentColor(.black) }
        #expect(div.attributes["style"]?().description == "accent-color: black;")
    }

    @Test("classes {} joins class names with single spaces")
    func classesAttribute() {
        let div = HTML.Div().classes { "a"; "b" }
        #expect(div.attributes["class"]?().description == "a b")
    }

    @Test("key() sets the internal _key attribute")
    func keyAttribute() {
        #expect(HTML.Div().key("k").attributes["_key"]?().description == "k")
    }

    @Test("style and class render as attributes; _key does not")
    func attributesRendered() {
        let div = HTML.Div()
            .classes { "x" }
            .style { CSS.accentColor(.black) }
            .key("k")
        #expect(renderer.render(div) == "<div class=\"x\" style=\"accent-color: black;\"></div>")
    }

    @Test("style {} with a false conditional renders only the remaining properties")
    func styleConditional() {
        let flag = false
        let div = HTML.Div().style {
            if flag { CSS.all(.inherit) }
            CSS.accentColor(.black)
        }
        #expect(div.attributes["style"]?().description == "accent-color: black;")
    }

    @Test("classes {} with a false conditional leaves no stray whitespace")
    func classesConditional() {
        let flag = false
        let div = HTML.Div().classes {
            if flag { "on" }
            "base"
        }
        #expect(div.attributes["class"]?().description == "base")
    }

    // MARK: - Lifecycle events

    @Test("onAppear registers _appear and invokes the closure")
    func onAppear() {
        var fired = false
        let div = HTML.Div().onAppear { fired = true }
        div.events["_appear"]?(.none)
        #expect(fired)
    }

    @Test("onDisappear registers _disappear")
    func onDisappear() {
        var fired = false
        let div = HTML.Div().onDisappear { fired = true }
        div.events["_disappear"]?(.none)
        #expect(fired)
    }

    @Test("onUpdate registers _update")
    func onUpdate() {
        var fired = false
        let div = HTML.Div().onUpdate { fired = true }
        div.events["_update"]?(.none)
        #expect(fired)
    }

    @Test("repeated onAppear calls run both closures in order")
    func onAppearChains() {
        var log: [String] = []
        let div = HTML.Div()
            .onAppear { log.append("first") }
            .onAppear { log.append("second") }
        div.events["_appear"]?(.none)
        #expect(log == ["first", "second"])
    }

    // MARK: - DOM events (generated)

    @Test("onClick registers a click handler")
    func onClick() {
        var clicks = 0
        let button = HTML.Button().onClick { clicks += 1 }
        button.events["click"]?(.none)
        button.events["click"]?(.none)
        #expect(clicks == 2)
    }

    @Test("onKeydown unwraps the key string from the EventResult")
    func onKeydownString() {
        var key = ""
        let input = HTML.Div().onKeydown { key = $0 }
        input.events["keydown:key"]?(.string("Enter"))
        #expect(key == "Enter")
    }

    @Test("onKeydown ignores non-string payloads")
    func onKeydownIgnoresOtherPayloads() {
        var calls = 0
        let input = HTML.Div().onKeydown { _ in calls += 1 }
        input.events["keydown:key"]?(.none)
        input.events["keydown:key"]?(.int(3))
        #expect(calls == 0)
    }

    // MARK: - Page forwarding

    @Test("Page.onAppear attaches to the first element in the body")
    func pageOnAppearForwards() {
        var fired = false
        let element = Wrapper().onAppear { fired = true }
        element.events["_appear"]?(.none)
        #expect(fired)
    }

    // MARK: - globalStore

    @Test("globalStore registers the object and _killEnvironmentObject removes it")
    func globalStoreLifecycle() {
        let manager = ServerManager()
        SailboatGlobal.initialize(manager)
        let theme = Theme()

        let div = HTML.Div().globalStore(theme)
        #expect(manager.objects["Theme"] === theme)

        div.events["_killEnvironmentObject"]?(.none)
        #expect(manager.objects["Theme"] == nil)
    }

    @Test("globalStore does not replace an object already registered for the type")
    func globalStoreKeepsExisting() {
        let manager = ServerManager()
        SailboatGlobal.initialize(manager)
        let first = Theme()
        let second = Theme()

        _ = HTML.Div().globalStore(first)
        _ = HTML.Div().globalStore(second)
        #expect(manager.objects["Theme"] === first)
    }
}
