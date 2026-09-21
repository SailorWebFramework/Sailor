// Tests/SailorTests/ServerManagerTests.swift
//
// ServerManager drives the Renderable pipeline for SSR. On non-WASI hosts the
// generated tags carry an EmptyRenderer, so it must fall back to StaticRenderer
// rather than returning an empty string.

import Sailboat
import Sailor
import SailorServer
import SailorShared
import Testing

/// An element that renders through an HTMLStringNode, exercising the node pipeline.
@MainActor
private struct NodeElement: Element {
    var attributes: [String: () -> any AttributeValue] = [:]
    var events: [String: (EventResult) -> Void] = [:]
    var content: () -> any Fragment = { List() }
    var renderer: any Renderable

    var body: Never { .error() }

    init(_ tag: String, children: @escaping () -> any Fragment = { List() }) {
        renderer = HTMLStringNode(named: tag)
        content = children
    }
}

@MainActor @Suite("ServerManager")
struct ServerManagerTests {

    @Test("renderToString renders generated tags on non-WASI hosts")
    func rendersGeneratedTags() {
        #expect(ServerManager().renderToString(page: HTML.P("hi")) == "<p>hi</p>")
    }

    @Test("renderToString renders nested trees and attributes")
    func rendersNestedTrees() {
        let html = ServerManager().renderToString(page: HTML.Div {
            HTML.P("a")
            HTML.A("b", href: "/b")
        })
        #expect(html == "<div><p>a</p><a href=\"/b\">b</a></div>")
    }

    @Test("renderToString uses the HTMLStringNode pipeline when an element provides one")
    func rendersNodePipeline() {
        var section = NodeElement("section")
        section.attributes["id"] = { "main" }
        section.content = { List([NodeElement("article")], hash: "") }
        let html = ServerManager().renderToString(page: section)
        #expect(html == "<section id=\"main\"><article></article></section>")
    }

    @Test("renderToString installs itself as the active Sailboat manager")
    func installsGlobalManager() {
        let manager = ServerManager()
        _ = manager.renderToString(page: HTML.Div())
        #expect(SailboatGlobal.manager === manager)
    }

    @Test("renderDocument wraps head and body in a full document")
    func rendersDocument() {
        let html = ServerManager().renderDocument(
            head: HTML.Head(),
            body: HTML.Body { HTML.P("Hello") }
        )
        #expect(html == "<!DOCTYPE html>\n<html>\n<head></head>\n<body><p>Hello</p></body>\n</html>")
    }

    @Test("ServerManager uses a ServerEventScheduler")
    func usesServerScheduler() {
        #expect(ServerManager().eventScheduler is ServerEventScheduler)
    }

    @Test("ServerEventScheduler ignores observed states")
    func schedulerIgnoresStates() {
        let scheduler = ServerEventScheduler()
        SailboatGlobal.initialize(TargetManager(scheduler))
        let s = State(wrappedValue: 0)
        scheduler.observe(state: s)
        s.wrappedValue = 1
        #expect(scheduler.states.isEmpty)
    }

    @Test("ServerEnvironment defaults url to / and accepts an explicit url")
    func environmentURL() {
        #expect(ServerEnvironment().url == "/")
        #expect(ServerEnvironment(url: "/docs").url == "/docs")
    }
}
