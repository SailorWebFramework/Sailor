// Tests/SailorTests/UnitTests.swift
//
// Verifies Unit.* enum cases produce correct CSS value strings.

import Sailor
import Testing

@Suite("Unit")
struct UnitTests {

    // MARK: - Unit.Length

    @Test("Unit.Length.px(16) produces '16px'")
    func lengthPx() {
        #expect(Unit.Length.px(16).description == "16px")
    }

    @Test("Unit.Length.em(1) produces '1em'")
    func lengthEm() {
        #expect(Unit.Length.em(1).description == "1em")
    }

    @Test("Unit.Length.rem(2) produces '2rem'")
    func lengthRem() {
        #expect(Unit.Length.rem(2).description == "2rem")
    }

    @Test("Unit.Length.vh(100) produces '100vh'")
    func lengthVh() {
        #expect(Unit.Length.vh(100).description == "100vh")
    }

    @Test("Unit.Length.vw(50) produces '50vw'")
    func lengthVw() {
        #expect(Unit.Length.vw(50).description == "50vw")
    }

    // MARK: - Unit.Color

    @Test("Unit.Color.hex('#fff') returns '#fff'")
    func colorHex() {
        #expect(Unit.Color.hex("#fff").description == "#fff")
    }

    @Test("Unit.Color.rgb(255,0,0) produces correct CSS")
    func colorRgb() {
        #expect(Unit.Color.rgb(255, 0, 0).description == "rgb(255 0 0)")
    }

    @Test("Unit.Color.black produces 'black'")
    func colorBlack() {
        #expect(Unit.Color.black.description == "black")
    }

    @Test("Unit.Color.transparent produces 'transparent'")
    func colorTransparent() {
        #expect(Unit.Color.transparent.description == "transparent")
    }

    // MARK: - Unit.Global

    @Test("Unit.Global.inherit produces 'inherit'")
    func globalInherit() {
        #expect(Unit.Global.inherit.description == "inherit")
    }

    @Test("Unit.Global.initial produces 'initial'")
    func globalInitial() {
        #expect(Unit.Global.initial.description == "initial")
    }

    @Test("Unit.Global.unset produces 'unset'")
    func globalUnset() {
        #expect(Unit.Global.unset.description == "unset")
    }

    @Test("Unit.Global.revert produces 'revert'")
    func globalRevert() {
        #expect(Unit.Global.revert.description == "revert")
    }

    // MARK: - Unit.Language

    @Test("Unit.Language.en produces 'en'")
    func languageEn() {
        #expect(Unit.Language.en.description == "en")
    }

    @Test("Unit.Language.fr produces 'fr'")
    func languageFr() {
        #expect(Unit.Language.fr.description == "fr")
    }
}
