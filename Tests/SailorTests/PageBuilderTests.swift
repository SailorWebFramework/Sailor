// Tests/SailorTests/PageBuilderTests.swift
//
// PageBuilder produces the Fragment hashes that reconcile uses to decide whether
// a conditional / loop body changed shape. These pin down that contract.

@_spi(Private) import Sailor
import Sailboat
import SailorShared
import Testing

@MainActor
private struct KeyedRow: Page {
    let key: String
    var body: some Page { HTML.Div().key(key) }
}

@MainActor @Suite("PageBuilder")
struct PageBuilderTests {

    // MARK: - Blocks & optionals

    @Test("buildBlock produces a List with an empty hash")
    func buildBlock() {
        let fragment = PageBuilder.buildBlock(HTML.Div(), HTML.Div())
        #expect(fragment.children.count == 2)
        #expect(fragment.hash == "")
    }

    @Test("buildOptional(nil) produces an empty List with hash '-'")
    func buildOptionalNil() {
        let fragment = PageBuilder.buildOptional(nil)
        #expect(fragment.children.isEmpty)
        #expect(fragment.hash == "-")
    }

    @Test("buildOptional passes a present fragment through unchanged")
    func buildOptionalPresent() {
        let fragment = PageBuilder.buildOptional(List([HTML.Div()], hash: "x"))
        #expect(fragment.children.count == 1)
        #expect(fragment.hash == "x")
    }

    // MARK: - if / else

    @Test("buildEither(first:) appends '1' to the hash")
    func buildEitherFirst() {
        #expect(PageBuilder.buildEither(first: List([], hash: "x")).hash == "x1")
    }

    @Test("buildEither(second:) appends '0' to the hash")
    func buildEitherSecond() {
        #expect(PageBuilder.buildEither(second: List([], hash: "x")).hash == "x0")
    }

    @Test("if/else branches with identical children get distinct hashes")
    func branchesDistinct() {
        let block = PageBuilder.buildBlock(HTML.Div())
        let first = PageBuilder.buildEither(first: block)
        let second = PageBuilder.buildEither(second: block)
        #expect(first.hash != second.hash)
    }

    // MARK: - for loops

    private func rows(_ n: Int) -> [any Page] {
        (0..<n).map { _ in PageBuilder.buildBlock(HTML.Div()) }
    }

    @Test("unkeyed buildArray hashes by element count")
    func unkeyedHashIsCount() {
        #expect(PageBuilder.buildArray(rows(2)).hash == "2")
        #expect(PageBuilder.buildArray(rows(3)).hash == "3")
    }

    @Test("unkeyed loops with different lengths get different hashes")
    func unkeyedLengthChangeDetected() {
        // Regression: this used to hash as "[]" for every length, so a loop that
        // grew or shrank hit reconcile's count-mismatch fatalError.
        #expect(PageBuilder.buildArray(rows(1)).hash != PageBuilder.buildArray(rows(2)).hash)
    }

    @Test("empty buildArray hashes as 0")
    func emptyArray() {
        let fragment = PageBuilder.buildArray([])
        #expect(fragment.children.isEmpty)
        #expect(fragment.hash == "0")
    }

    @Test("keyed buildArray hashes by the nested keys")
    func keyedHash() {
        let fragment = PageBuilder.buildArray([
            PageBuilder.buildBlock(HTML.Div().key("a")),
            PageBuilder.buildBlock(HTML.Div().key("b"))
        ])
        #expect(fragment.hash == "[[a][b]]")
    }

    @Test("keyed loops with the same length but different keys get different hashes")
    func keyedChangeDetected() {
        let ab = PageBuilder.buildArray([
            PageBuilder.buildBlock(HTML.Div().key("a")),
            PageBuilder.buildBlock(HTML.Div().key("b"))
        ])
        let ac = PageBuilder.buildArray([
            PageBuilder.buildBlock(HTML.Div().key("a")),
            PageBuilder.buildBlock(HTML.Div().key("c"))
        ])
        #expect(ab.hash != ac.hash)
    }

    @Test("keys inside a custom Page are discovered through its body")
    func keyThroughCustomPage() {
        let fragment = PageBuilder.buildArray([KeyedRow(key: "z")])
        #expect(fragment.hash == "[[z]]")
    }

    @Test("a mix of keyed and unkeyed rows still hashes by the keys present")
    func mixedKeys() {
        let fragment = PageBuilder.buildArray([
            PageBuilder.buildBlock(HTML.Div()),
            PageBuilder.buildBlock(HTML.Div().key("k"))
        ])
        #expect(fragment.hash == "[[k]]")
    }
}
