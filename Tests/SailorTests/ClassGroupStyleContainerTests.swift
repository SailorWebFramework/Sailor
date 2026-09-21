// Tests/SailorTests/ClassGroupStyleContainerTests.swift
//
// Verifies ClassGroup.description and StyleContainer (StyleGroup) description
// format correctly with joined(separator:) implementation.

@testable import Sailor
import Testing

@Suite("ClassGroup.description")
struct ClassGroupDescriptionTests {

    @Test("multiple classes are separated by a single space")
    func multipleClassesSeparatedBySpace() {
        let group = ClassGroup { ClassGroup(["flex", "items-center", "gap-4"]) }
        #expect(group.description == "flex items-center gap-4")
    }

    @Test("empty ClassGroup returns empty string")
    func emptyClassGroupReturnsEmpty() {
        let group = ClassGroup([] as [any DynamicClass])
        #expect(group.description == "")
    }

    @Test("single class has no trailing space")
    func singleClassNoTrailingSpace() {
        let group = ClassGroup(["only-class"] as [any DynamicClass])
        #expect(group.description == "only-class")
        #expect(!group.description.hasSuffix(" "))
    }

    @Test("two classes produce exactly one space between them")
    func twoClassesOneSpace() {
        let group = ClassGroup(["a", "b"] as [any DynamicClass])
        #expect(group.description == "a b")
    }

}

@Suite("StyleContainer.description")
struct StyleContainerDescriptionTests {

    @Test("StyleGroup with multiple properties concatenates without separator")
    func multiplePropertiesNoSeparator() {
        let p1 = CSS.color(.red)
        let p2 = CSS.color(.blue)
        let group = StyleGroup([p1, p2])
        let expected = p1.description + p2.description
        #expect(group.description == expected)
    }

    @Test("empty StyleGroup returns empty string")
    func emptyStyleGroupReturnsEmpty() {
        let group = StyleGroup([])
        #expect(group.description == "")
    }

    @Test("single property description matches Property.description")
    func singlePropertyMatchesPropertyDescription() {
        let prop = CSS.color(.blue)
        let group = StyleGroup([prop])
        #expect(group.description == prop.description)
    }

}
