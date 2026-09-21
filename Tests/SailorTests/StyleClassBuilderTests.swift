// Tests/SailorTests/StyleClassBuilderTests.swift
//
// ClassBuilder / StyleBuilder result-builder semantics and the container types
// they produce.

@_spi(Private) import Sailor
import Sailboat
import Testing

@MainActor @Suite("StyleClassBuilders")
struct StyleClassBuilderTests {

    // MARK: - ClassBuilder

    @Test("ClassBuilder.buildOptional(nil) yields an empty group")
    func classOptionalNil() {
        #expect(ClassBuilder.buildOptional(nil).description == "")
    }

    @Test("ClassBuilder.buildOptional passes a present group through")
    func classOptionalPresent() {
        let group = ClassBuilder.buildBlock("a")
        #expect(ClassBuilder.buildOptional(group).description == "a")
    }

    @Test("ClassBuilder.buildEither passes both branches through")
    func classEither() {
        let group = ClassBuilder.buildBlock("a")
        #expect(ClassBuilder.buildEither(first: group).description == "a")
        #expect(ClassBuilder.buildEither(second: group).description == "a")
    }

    @Test("ClassBuilder.buildArray joins loop bodies")
    func classArray() {
        #expect(ClassBuilder.buildArray(["a", "b", "c"]).description == "a b c")
    }

    @Test("ClassGroup flattens nested groups and drops empty ones")
    func classGroupNested() {
        let flag = false
        let group = ClassGroup {
            if flag { "on" }
            "base"
            ClassGroup { "x"; "y" }
        }
        #expect(group.description == "base x y")
    }

    // MARK: - StyleBuilder

    @Test("StyleBuilder.buildOptional(nil) yields an empty group")
    func styleOptionalNil() {
        #expect(StyleBuilder.buildOptional(nil).description == "")
    }

    @Test("StyleBuilder.buildOptional passes a present group through")
    func styleOptionalPresent() {
        let group = StyleBuilder.buildBlock(CSS.all(.inherit))
        #expect(StyleBuilder.buildOptional(group).description == "all: inherit;")
    }

    @Test("StyleBuilder.buildEither passes both branches through")
    func styleEither() {
        let group = StyleBuilder.buildBlock(CSS.all(.inherit))
        #expect(StyleBuilder.buildEither(first: group).description == "all: inherit;")
        #expect(StyleBuilder.buildEither(second: group).description == "all: inherit;")
    }

    @Test("StyleBuilder.buildArray concatenates properties")
    func styleArray() {
        let group = StyleBuilder.buildArray([CSS.all(.inherit), CSS.accentColor(.black)])
        #expect(group.description == "all: inherit;accent-color: black;")
    }

    @Test("StyleGroup flattens nested groups")
    func styleGroupNested() {
        let group = StyleGroup {
            CSS.all(.inherit)
            StyleGroup { CSS.accentColor(.black) }
        }
        #expect(group.description == "all: inherit;accent-color: black;")
    }

    @Test("Style equality is by rendered description")
    func styleEquality() {
        #expect(CSS.all(.inherit) == CSS.all(.inherit))
        #expect(CSS.all(.inherit) != CSS.all(.unset))
    }
}
