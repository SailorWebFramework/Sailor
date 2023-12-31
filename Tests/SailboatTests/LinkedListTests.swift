import XCTest
@testable import Sailboat

final class LinkedListTests: XCTestCase {
    
    func testSingleAppend() throws {
        var list: LinkedList<Int> = LinkedList()
        
        _ = list.append(10)
        
        XCTAssertEqual(list.head?.value, 10, "Appended value incorrect")
        XCTAssertEqual(list.head?.next?.value, 10, "Appended value not circular")
        XCTAssertEqual(list.head?.prev?.value, 10, "Appended value not circular")

    }
    
    func testDoubleAppend() throws {
        var list: LinkedList<Int> = LinkedList()
        
        _ = list.append(10)
        
        _ = list.append(12)

        XCTAssertEqual(list.head?.value, 10, "Appended value incorrect")
        XCTAssertEqual(list.head?.prev?.value, 12, "Appended value not circular")

        XCTAssertEqual(list.head?.next?.value, 12, "Appended value incorrect")
        XCTAssertEqual(list.head?.next?.prev?.value, 10, "Appended value not circular")
        
        XCTAssertEqual(list.head?.next?.next?.value, 10, "Appended value not circular")

    }
    
    func testRemoveSingle() throws {
        var list: LinkedList<Int> = LinkedList()
        
        let node1 = list.append(10)
        list.remove(node1)

        XCTAssertEqual(list.head?.value, nil, "Removed value exists")
        XCTAssertEqual(node1.prev?.next?.value, nil, "Removed value contains leaked pointer")
        XCTAssertNotEqual(node1.next?.prev?.value, 10, "Removed value contains leaked pointer")
        XCTAssertEqual(node1.next?.value, nil, "Removed value contains leaked pointer")


    }
    
    func testRemoveMiddle() throws {
        var list: LinkedList<Int> = LinkedList()
        
        let node1 = list.append(10)
        let node2 = list.append(12)
        let node3 = list.append(14)
        
        list.remove(node2)
        
        XCTAssertEqual(node2.next?.value, nil, "removed value holds a reference")
        
        XCTAssertEqual(list.head?.value, 10, "Appended value incorrect")
        XCTAssertEqual(list.head?.prev?.value, 14, "Appended value not circular")
        
        XCTAssertEqual(list.head?.next?.value, 14, "Appended value incorrect")
        XCTAssertEqual(list.head?.next?.prev?.value, 10, "Appended value incorrect")
        
        XCTAssertEqual(list.head?.next?.next?.value, 10, "Appended value incorrect")
        
    }
    
    func testRemoveLast() throws {
        var list: LinkedList<Int> = LinkedList()
        
        let node1 = list.append(10)
        let node2 = list.append(12)
        
        list.remove(node2)

        XCTAssertEqual(node2.next?.value, nil, "removed value holds a reference")

        XCTAssertEqual(list.head?.value, 10, "Appended value incorrect")
        
        XCTAssertEqual(list.head?.next?.value, 10, "Appended value incorrect")
        XCTAssertEqual(list.head?.prev?.value, 10, "Appended value not circular")

    }
    
    func testRemoveFirst() throws {
        var list: LinkedList<Int> = LinkedList()
        
        let node1 = list.append(10)
        let node2 = list.append(12)
        
        list.remove(node1)

        XCTAssertEqual(node1.next?.value, nil, "removed value holds a reference")

        XCTAssertEqual(list.head?.value, 12, "Appended value incorrect")
        
        XCTAssertEqual(list.head?.next?.value, 12, "Appended value incorrect")
        XCTAssertEqual(list.head?.prev?.value, 12, "Appended value not circular")

        

    }
    
    func testIndexArray() {
        var list: LinkedList<Int> = LinkedList([1,2,3,4])

        XCTAssertEqual(list.count, 4, "Count is not incorrect")
    
        XCTAssertEqual(list[0], 1, "Index is not functioning correctly")

        XCTAssertEqual(list[1], 2, "Index is not functioning correctly")

        XCTAssertEqual(list[2], 3, "Index is not functioning correctly")

        XCTAssertEqual(list[3], 4, "Index is not functioning correctly")
    }
    
    func testCount() {
        var list: LinkedList<Int> = LinkedList([1,2,3,4])

        XCTAssertEqual(list.count, 4, "Count is not incorrect")
        
        list = LinkedList([1])

        XCTAssertEqual(list.count, 1, "Count is not incorrect")

        list = LinkedList()

        XCTAssertEqual(list.count, 0, "Count is not incorrect")

    }
    
    func testInitialize() {
        let list: LinkedList<Int> = LinkedList([1,2,3,4])
        
        XCTAssertEqual(list.head?.prev?.value, 4, "Initialized value incorrect")
        XCTAssertEqual(list.head?.value, 1, "Initialized value incorrect")
        XCTAssertEqual(list.head?.next?.value, 2, "Initialized value incorrect")
        XCTAssertEqual(list.head?.next?.next?.value, 3, "Initialized value incorrect")
        XCTAssertEqual(list.head?.next?.next?.next?.value, 4, "Initialized value incorrect")
        XCTAssertEqual(list.head?.next?.next?.next?.next?.value, 1, "Initialized value incorrect")

    }
    
    func testClear() {
        var list: LinkedList<Int> = LinkedList([1,2,3,4])
        
        let head = list.head
        let end = list.head?.prev
        
        list.clear()
        
        XCTAssertEqual(list.head?.value, nil, "did not clear value")
//        XCTAssertEqual(head?.next?.value, nil, "did not clear value")
        XCTAssertEqual(end?.next?.value, nil, "did not clear value")

    }
}
