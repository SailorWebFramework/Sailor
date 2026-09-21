// Tests/SailorTests/GridMaskHiddenTests.swift
//
// Coverage for the grid-template / mask additions and the hidden="until-found"
// overload, plus the regression for track lists rendering as a Swift array.

@_spi(Private) import Sailor
import Sailboat
import SailorServer
import SailorShared
import Testing

@MainActor @Suite("GridMaskHidden")
struct GridMaskHiddenTests {

    let renderer = StaticRenderer()

    @Test("track lists join with spaces, not as a Swift array")
    func trackListJoin() {
        // Regression: this rendered as grid-template-rows: ["1fr", "2fr"]
        #expect(CSS.grid(rowSizes: .fr(1), .fr(2)).description == "grid-template-rows: 1fr 2fr;")
        #expect(CSS.grid(colSizes: .auto, .px(200)).description == "grid-template-columns: auto 200px;")
    }

    @Test("grid-template rows / columns form")
    func gridTemplateTracks() {
        let p = CSS.gridTemplate(rows: .tracks(.fr(1), .auto), columns: .tracks(.px(100), .fr(2)))
        #expect(p.description == "grid-template: 1fr auto / 100px 2fr;")
    }

    @Test("grid-template named-areas form with row sizes")
    func gridTemplateAreas() {
        let p = CSS.gridTemplate(
            areas: .rows(.sized("header header", .px(80)), .sized("sidebar main", .fr(1)), .area("footer footer")),
            columns: .tracks(.px(200), .fr(1))
        )
        #expect(p.description == "grid-template: 'header header' 80px 'sidebar main' 1fr 'footer footer' / 200px 1fr;")
    }

    @Test("mask shorthand with position and size")
    func maskShorthand() {
        let p = CSS.mask(image: .url("m.svg"), position: .xy(.direction(.left), .direction(.top)), size: .contain, repeat: .noRepeat, mode: .alpha)
        // optional slots that are nil leave their separator behind; harmless in CSS
        #expect(p.description.split(separator: " ", omittingEmptySubsequences: true).joined(separator: " ")
                == "mask: url(m.svg) left top / contain no-repeat alpha;")
    }

    @Test("mask-border longhands")
    func maskBorderLonghands() {
        #expect(CSS.maskBorder(source: .url("b.png")).description == "mask-border-source: url(b.png);")
        #expect(CSS.maskBorder(mode: .luminance).description == "mask-border-mode: luminance;")
    }

    @Test("hidden keeps presence semantics and gains until-found")
    func hiddenOverloads() {
        #expect(renderer.render(HTML.Div().hidden()) == "<div hidden></div>")
        #expect(renderer.render(HTML.Div().hidden(false)) == "<div></div>")
        #expect(renderer.render(HTML.Div().hidden(.untilFound)) == "<div hidden=\"until-found\"></div>")
    }
}
