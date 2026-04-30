// Tests/SailorTests/CSSPropertyTests.swift
//
// Verifies CSS.* static factory functions produce Property values with the
// correct name, value, and description strings.

@testable import Sailor
import Testing

@Suite("CSSProperty")
struct CSSPropertyTests {

    // MARK: - CSS.all

    @Test("CSS.all(.inherit) has name 'all'")
    func allName() {
        #expect(CSS.all(.inherit).name == "all")
    }

    @Test("CSS.all(.inherit) has value 'inherit'")
    func allInheritValue() {
        #expect(CSS.all(.inherit).value == "inherit")
    }

    @Test("CSS.all(.initial) has value 'initial'")
    func allInitialValue() {
        #expect(CSS.all(.initial).value == "initial")
    }

    @Test("CSS.all(.unset) description has 'name: value;' format")
    func allDescription() {
        let prop = CSS.all(.unset)
        #expect(prop.description == "all: unset;")
    }

    // MARK: - CSS.accentColor

    @Test("CSS.accentColor(.black) has correct name and value")
    func accentColorBlack() {
        let prop = CSS.accentColor(.black)
        #expect(prop.name == "accent-color")
        #expect(prop.value == "black")
    }

    @Test("CSS.accentColor(.hex('#ff0000')) has hex value")
    func accentColorHex() {
        let prop = CSS.accentColor(.hex("#ff0000"))
        #expect(prop.value == "#ff0000")
    }

    // MARK: - Property description format

    @Test("Property description is 'name: value;'")
    func propertyDescriptionFormat() {
        let prop = CSS.all(.inherit)
        let parts = prop.description.split(separator: " ")
        // "all:" "inherit;"
        #expect(parts.count == 2)
        #expect(parts[0] == "all:")
        #expect(parts[1] == "inherit;")
    }

    // MARK: - Hashable

    @Test("Property with same content is equal when hashed")
    func propertyHashEquality() {
        let p1 = CSS.all(.inherit)
        let p2 = CSS.all(.inherit)
        #expect(p1.hashValue == p2.hashValue)
    }

    @Test("Properties with different values have different hashes")
    func propertyHashInequality() {
        let p1 = CSS.all(.inherit)
        let p2 = CSS.all(.initial)
        #expect(p1.hashValue != p2.hashValue)
    }
}
