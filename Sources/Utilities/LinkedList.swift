//
//  File.swift
//
//
//  Created by Joshua Davis on 12/18/23.
//

import Foundation
public class LinkedList<Value>: Sequence {
    
    var head: LinkedListNode<Value>? = nil

    var count: Int {
        if let head = head {
            let start = head
            print(start)
            var current: LinkedListNode<Value>? = head.next
            var total = 1
            
            while current !== start {
                print(current)
                current = current?.next
                total += 1
            }
            
            return total
        }
        
        return 0
    }
    
    func clear() {
        while self.head != nil {
            self.remove(self.head)
        }
        
    }
    
    func append(_ value: Value) -> LinkedListNode<Value> {
        if let head = head {
            return head.pushAfter(value)
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
            } else {
                self.head = node
            }
        }
        
        node.remove()
    }
    
    public func makeIterator() -> LinkedListIterator<Value> {
        return LinkedListIterator(current: head)
    }
    
    
    public func printList() {
        for state in self {
            Swift.print(state)
        }
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
    private(set) var next: LinkedListNode?
    private(set) var prev: LinkedListNode?
    
    public var description: String {
        "[\(value)]"
    }
    
    public convenience init(value: Value) {
        self.init(value: value, next: nil, prev: nil)
        self.next = self
        self.prev = self

    }
    
    private init(value: Value, next: LinkedListNode?, prev: LinkedListNode?) {
        self.value = value
        self.next = next
        self.prev = prev
    }
    
    public func remove() {
        self.prev?.next = self.next
        self.next?.prev = self.prev
        
        self.next = nil
        self.prev = nil
    }
    
    public func pushAfter(_ value: Value) -> LinkedListNode {
        let node = LinkedListNode(value: value, next: self.next, prev: self)
        self.pushAfter(node)
        return node
        
    }
    
    private func pushAfter(_ node: LinkedListNode) {
        self.next?.prev = node
        self.next = node

    }
    
    public func pushBefore(_ value: Value) -> LinkedListNode {
        let node = LinkedListNode(value: value, next: self.next, prev: self)
        self.pushBefore(node)
        return node
    }
    
    private func pushBefore(_ node: LinkedListNode) {
        self.prev?.next = node
        self.prev = node
    }
}
