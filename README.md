# Sailor

A strongly typed, SwiftUI-style web framework in Swift. Pages compile to WebAssembly for the
browser, and the same element tree renders to HTML on the server.

![Sailor Logo](https://i.ibb.co/tZ4vRD7/DALL-E-2023-12-19-04-26-35-Revise-the-first-logo-design-for-the-Sailor-frontend-web-framework-ensuri.png)

```swift
import Sailor

@MainActor struct Counter: @preconcurrency Page {
    @Signal var count = 0

    var body: some Page {
        HTML.Div {
            HTML.Span("Count: \(count)")
            HTML.Button("Increment").onClick { count += 1 }
        }
        .style { CSS.display(.flex) }
    }
}
```

Every tag, attribute, CSS property, unit and DOM event is a Swift type, generated from the
[Treasure](https://github.com/SailorWebFramework/Treasure) specification by
[Shipwright](https://github.com/SailorWebFramework/Shipwright). If it compiles, it is valid HTML/CSS.

## Requirements

- Swift 6.0 or later (tested on 6.2)
- For browser builds, a Swift SDK for WebAssembly plus the matching
  [swift.org toolchain](https://www.swift.org/documentation/articles/wasm-getting-started.html)
  — Xcode's bundled toolchain cannot target wasm. `swift sdk list` should show a wasm entry
  such as `swift-6.2.3-RELEASE_wasm`
- Optionally the [Harbor CLI](https://github.com/SailorWebFramework/Harbor-CLI) for
  `harbor init` / `harbor run web` / `harbor build web`

## Getting started

```bash
harbor init MyApp && cd MyApp
harbor run web            # builds to WASM, serves on http://localhost:8080
```

Or by hand — add Sailor to an executable package:

```swift
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MyApp",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/SailorWebFramework/Sailor", from: "0.4.0"),
    ],
    targets: [
        .executableTarget(name: "MyApp", dependencies: ["Sailor"], path: "Sources"),
    ]
)
```

then build with the WebAssembly SDK and serve the PackageToJS output:

```bash
swift package --swift-sdk swift-6.2.3-RELEASE_wasm js   # use the id from `swift sdk list`
# artifacts land in .build/plugins/PackageToJS/outputs/Package
```

The [sailor-shore](https://github.com/SailorWebFramework/sailor-shore) repo is the framework's
own website and doubles as a complete example (routing, Tailwind, multi-page layout).

## Usage

### Entry point

A website is a `Website` with a `head` and a `body`:

```swift
@main
struct MyApp: @preconcurrency Website {

    @MainActor var head: some Head {
        HTML.Head {
            HTML.Title("My App")
            HTML.Meta().charset("UTF-8")
        }
    }

    @MainActor var body: some Body {
        HTML.Body {
            HomePage()
        }
    }
}
```

### Pages and tags

`Page` is the component protocol. Bodies are result builders that accept HTML elements and other
pages; text goes in the initializer.

```swift
@MainActor struct HomePage: @preconcurrency Page {
    var body: some Page {
        HTML.Div {
            HTML.H1("Hello")
            HTML.P { HTML.B("Sailor"); " is typed." }
            Counter()
        }
    }
}
```

All tags live in the `HTML` namespace so it is always clear what is a native element and what is a
component. Alias the ones you use often: `typealias Div = HTML.Div`.

Conditionals and loops work inside bodies. Loops re-render when their length changes; give rows a
`.key(...)` to re-render when the key changes instead.

```swift
HTML.Ul {
    if names.isEmpty {
        HTML.Li("Nobody here")
    }
    for name in names {
        HTML.Li(name).key(name)
    }
}
```

### Attributes and styling

Attributes are modifiers. Element-specific ones (`href`, `src`, `.value`, …) are generated from
the spec; `.style { }` takes typed CSS and `.classes { }` takes class names.

```swift
HTML.A("Docs", href: "/docs")
    .style {
        CSS.display(.inlineBlock)
        CSS.font(size: .px(18))
        CSS.font(weight: .bold)
        "line-height: 1.6;"          // raw strings are allowed as an escape hatch
    }
    .classes {
        "nav-link"
        if isActive { "active" }
    }
```

With [Fleet-Tailwind](https://github.com/SailorWebFramework/Fleet-Tailwind) the class names are
typed too (`TW.flex`, `TW.textXl`, …) and `harbor build web` tree-shakes the CSS down to the
classes you referenced.

### Reactivity

`@Signal` (an alias of Sailboat's `@State`) is the unit of reactivity. Reading a signal inside a
body or attribute closure records the dependency; writing it re-renders only those elements — no
virtual DOM.

```swift
@MainActor struct Login: @preconcurrency Page {
    @Signal var email = ""
    @Signal var submitted = false

    var body: some Page {
        HTML.Form {
            HTML.Input.Text($email)          // two-way Binding
            HTML.Button("Send").onClick { submitted = true }
            if submitted {
                HTML.P("Thanks, \(email)")
            }
        }
    }
}
```

Shared objects use `@Store` (owned), `@ObservedStore` (passed in) and `@GlobalStore` (registered
with `.globalStore(obj)` on an ancestor element).

### Events and handles

DOM events are typed modifiers: `onClick`, `onInput { text in }`, `onKeydown { key in }`,
`onSubmit`, and so on for every event in the spec. Lifecycle hooks are `onAppear`, `onDisappear`,
`onUpdate` and `task { await … }`.

`onAppear`/`onDisappear` can also hand you a typed handle for imperative DOM calls:

```swift
HTML.Input.Text($query)
    .onAppear { (input: InputHandle) in input.focus() }

HTML.Dialog { … }
    .onAppear { (dialog: DialogHandle) in dialog.showModal() }
```

Browser APIs (`alert`, `fetch`, `setTimeout`, …) are available on every `Page`.

### Routing

[Navigator](https://github.com/SailorWebFramework/Navigator) provides an enum-based router:

```swift
Router(for: SiteRoute.self) { route in
    switch route {
    case .home: HomePage()
    case .docs: DocsPage()
    }
} notFound: {
    NotFoundPage()
}
```

### Server-side rendering

The `SailorServer` product renders the same pages to HTML strings on macOS/Linux:

```swift
import SailorServer

let html = StaticRenderer().render(HomePage())
let document = ServerManager().renderDocument(head: MyApp().head, body: MyApp().body)
```

`StaticRenderer` walks the element tree directly; `ServerManager` drives the full render
pipeline through `HTMLStringNode` renderers and falls back to `StaticRenderer` for generated tags.

## Architecture

```
Treasure (JSON spec) ──Shipwright (Python codegen)──▶ Sailor/Sources/Sailor/Sources/Generated/
                                                        │
Sailboat (signals, reconciliation, TargetManager) ◀─────┤
                                                        │
SailorWeb (JSNode renderer, WASI only) ◀────────────────┼──▶ SailorServer (HTMLStringNode, SSR)
```

- **Sailboat** — the renderer-agnostic core: `@State`/`Binding`, `Page`/`Element`/`Fragment`,
  dependency tracking and the reconcile algorithm.
- **Sailor** — the public API: `HTML.*`, `CSS.*`, `Unit.*`, events, handles, builders.
- **SailorWeb** — `JSNode` renderer over JavaScriptKit; compiled only for `wasm32-unknown-wasi`.
- **SailorServer** — `StaticRenderer` / `ServerManager` for SSR and static generation.

Never edit `Sources/Sailor/Sources/Generated/` by hand. Change Treasure (data) or Shipwright
(templates) and regenerate:

```bash
cd ../Shipwright
python3 main.py build sailor --treasuredir ../Treasure/json \
    --outdir ../Sailor/Sources/Sailor/Sources/Generated
```

## Development

```bash
swift test                                   # SailorTests + SailorIntegrationTests (macOS)
swift build --swift-sdk swift-6.2.3-RELEASE_wasm   # confirm the SailorWeb target still compiles
```

CI runs the macOS test suite on every push; Shipwright's CI additionally regenerates Sailor from
Treasure and compiles it, so codegen drift is caught before it lands.

## Ecosystem

| Repo | Role |
|---|---|
| [Sailboat](https://github.com/SailorWebFramework/Sailboat) | Signals-based core |
| [Treasure](https://github.com/SailorWebFramework/Treasure) | HTML/CSS specification (JSON) |
| [Shipwright](https://github.com/SailorWebFramework/Shipwright) | Code generator |
| [Harbor-CLI](https://github.com/SailorWebFramework/Harbor-CLI) | `harbor init` / `run web` / `build web` |
| [Navigator](https://github.com/SailorWebFramework/Navigator) | Router |
| [Fleet-Tailwind](https://github.com/SailorWebFramework/Fleet-Tailwind) | Typed Tailwind classes |
| [sailor-shore](https://github.com/SailorWebFramework/sailor-shore) | The website, built with Sailor |
