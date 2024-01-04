//
//  File.swift
//
//
//  Created by Joshua Davis on 12/18/23.
//

public class LinkedList<Value>: Sequence {
    
    private(set) var head: LinkedListNode<Value>? = nil
        
    // TODO: tail?
//    private(set) var tail: LinkedListNode<Value>? = nil
    
    public init() { }
    
//    public init(arrayLiteral elements: Value...) {
//        initialize(elements)
//    
//    }
    
    public init(_ elements: [Value]) {
        initialize(elements)
    }
    
    private func initialize(_ elements: [Value]) {
        for element in elements {
            _ = self.append(element)
        }
    }
    
    var isEmpty: Bool {
        count == 0
    }

    var count: Int {
        if let head = head {
            let start = head
            var current: LinkedListNode<Value>? = head.next
            var total = 1
            
            while current !== start {
                if current == nil {
                    fatalError("Linked List is not circular")
                } else if total > 1000 {
                    fatalError("Linked List incorrectly chained")
                }
                current = current?.next
                total += 1
            }
            
            return total
        }
        
        return 0
    }
    
    
    
    subscript(index: Int) -> Value {
        if index == 0 {
            return head!.value
        }

        var current: LinkedListNode<Value>? = head?.next
        var total = 1

        if let head = head {
            let start = head

            current = head.next
            
            while current !== start && total < index {
                if total > index {
                    fatalError("index out of range")
                }
                
                current = current?.next
                total += 1

            }
        }
        
        // TODO: throw error if out of range?
        return current!.value
    }
    
    func clear() {
        self.head?.prev?.next = nil
        self.head = nil
    }
    
    func append(_ value: Value) -> LinkedListNode<Value> {
        // if at least one item in array
        
        if let head = head {
            if let last = head.prev {
                return last.pushAfter(value)
            }
            fatalError("Linked List is not circular")
        }

        
        // if self.head == none
        self.head = LinkedListNode(value: value)

        return self.head!
    }
    
    func remove(_ node: LinkedListNode<Value>?) {
        guard let node = node else { return }
        if let head = head {
            if head.next === head.prev && head === head.next && head === node {
                self.head = nil
            } else if head === node {
                self.head = self.head?.next
            }
            
            node.remove()
            
        }
        
    }
    
    public func makeIterator() -> LinkedListIterator<Value> {
        return LinkedListIterator(current: head)
    }
    
    // TODO: remove the states name here, lol why
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
    
    fileprivate func replace(with node: LinkedListNode) {
        node.prev = self.prev
        node.next = self.next
        
        self.prev?.next = node
        self.next?.prev = node
        
        self.prev = nil
        
        self.next = nil
    }
    
    fileprivate func remove() {
        self.prev?.next = self.next
        self.next?.prev = self.prev
        
        self.next = nil
//        self.prev = nil
    }
    
    fileprivate func pushAfter(_ value: Value) -> LinkedListNode {
        let node = LinkedListNode(value: value, next: self.next, prev: self)
        self.pushAfter(node)
        return node
        
    }
    
    fileprivate func pushAfter(_ node: LinkedListNode) {
        node.prev = self
        node.next = self.next
        
        self.next?.prev = node
        self.next = node
        
    }
    
    fileprivate func pushBefore(_ value: Value) -> LinkedListNode {
        let node = LinkedListNode(value: value, next: self.next, prev: self)
        self.pushBefore(node)
        return node
    }
    
    fileprivate func pushBefore(_ node: LinkedListNode) {
        node.prev = self.prev
        node.next = self
        
        self.prev?.next = node
        self.prev = node
    }
}
