//
//  File.swift
//
//
//  Created by Joshua Davis on 12/18/23.
//

import Foundation
public class LinkedList<Value>: Sequence {
    
    private(set) var head: LinkedListNode<Value>? = nil
    
    var isEmpty: Bool {
        count == 0
    }

    var count: Int {
        if let head = head {
            let start = head
            var current: LinkedListNode<Value>? = head.next
            var total = 1
            
            while current !== start {
                current = current?.next
                total += 1
            }
            
            return total
        }
        
        return 0
    }
    
    subscript(index: Int) -> Value? {
        if index == 0 {
            // TODO: throw error
            return head?.value
        }

        var current: LinkedListNode<Value>? = head?.next
        var total = 1

        if let head = head {
            let start = head

            current = head.next
            
            while current !== start && total == index {
                current = current?.next
                total += 1
            }

        }
        
        if total != index {
            return nil
        }
        
        // TODO: throw error if out of range?
        return current?.value
    }
    
    func clear() {
        
        self.head?.prev?.next = nil
        self.head = nil
//        while self.head != nil {
//            self.remove(self.head)
//        }
        
    }
    
    func append(_ value: Value) -> LinkedListNode<Value> {
        if let last = head?.prev {
            return last.pushAfter(value)
        }
        
        let node = LinkedListNode(value: value)
        self.head = node
        
        return node
    }
    
    func remove(_ node: LinkedListNode<Value>?) {
        guard let node = node else { return }
        if let head = head {
            if head.next === head.prev && head === node {
                self.head = nil
            }
        }
        
        node.remove()
    }
    
    public func makeIterator() -> LinkedListIterator<Value> {
        return LinkedListIterator(current: head)
    }
    
    
    public func printList() {
        var output = "States: "
        for state in self {
            output += "[\(state)],"
        }
        output += ";; COUNT: \(count)"

        Swift.print(output)

    }
    
}

public class LinkedListIterator<Value>: IteratorProtocol {
    private var current: LinkedListNode<Value>?
    private var head: LinkedListNode<Value>?

    init(current: LinkedListNode<Value>?) {
        self.current = current
        self.head = current
    }

    public func next() -> Value? {
        guard let currentNode = current else { return nil }
        defer { current = currentNode.next === self.head ? nil : currentNode.next }
        return currentNode.value
    }
}


/// linked list Node representation
public class LinkedListNode<Value>: CustomStringConvertible {

    public var value: Value
    fileprivate(set) var next: LinkedListNode?
    weak fileprivate(set) var prev: LinkedListNode?
    
    public var description: String {
        "[\(value)]"
    }
    
    public convenience init(value: Value) {
        self.init(value: value, next: nil, prev: nil)
        self.next = self
        self.prev = self

    }
    
    deinit {
        print("FREEING NODE: [\(value)]")
    }
    
    private init(value: Value, next: LinkedListNode?, prev: LinkedListNode?) {
        self.value = value
        self.next = next
        self.prev = prev
    }
    
    public func replace(with node: LinkedListNode) {
        node.prev = self.prev
        node.next = self.next
        
        self.prev?.next = node
        self.next?.prev = node
        
        self.next = nil
    }
    
    public func remove() {
        self.prev?.next = self.next
        self.next?.prev = self.prev
        
        self.next = nil
//        self.prev = nil
    }
    
    public func pushAfter(_ value: Value) -> LinkedListNode {
        let node = LinkedListNode(value: value, next: self.next, prev: self)
        self.pushAfter(node)
        return node
        
    }
    
    private func pushAfter(_ node: LinkedListNode) {
        node.prev = self
        node.next = self.next
        
        self.next?.prev = node
        self.next = node
        
    }
    
    public func pushBefore(_ value: Value) -> LinkedListNode {
        let node = LinkedListNode(value: value, next: self.next, prev: self)
        self.pushBefore(node)
        return node
    }
    
    private func pushBefore(_ node: LinkedListNode) {
        node.prev = self.prev
        node.next = self
        
        self.prev?.next = node
        self.prev = node
    }
}
