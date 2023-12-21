//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/18/23.
//

import Foundation

public typealias StateValue = any Equatable

//final class StateValueReference {
//    var value: StateValue
//
//    public init(value: StateValue) {
//        self.value = value
//    }
//}
typealias StateNode = LinkedListNode<StateValue>
//final class StateNode: LinkedListNode<StateValue> { }

/// linked list representation that each node holds the state values of a page
//public final class StateNode: CustomStringConvertible {
//    public var value: StateValue
//    private(set) var next: StateNode?
//    private(set) var prev: StateNode?
//
//
//    public var description: String {
//        "[\(value)]"
//    }
//
////    public convenience init(value: StateValue) {
////        self.init(value: value, next: self, prev: self)
////    }
//
//    public convenience init(value: StateValue) {
//        self.init(value: value, next: nil, prev: nil)
//        self.next = self
//        self.prev = self
//    }
//
//    private init(value: StateValue, next: StateNode? = nil, prev: StateNode? = nil) {
//        self.value = value
//        self.next = next
//        self.prev = prev
//    }
//
////    func appendValue(_ value: StateValue){
////        self.values.append(StateValueReference(value: value))
////    }
//
//    func total() -> Int {
//        return total(start: self, current: self.next)
//    }
//
//    // TODO: this might be wrong
//    private func total(start: StateNode, current: StateNode? = nil) -> Int {
//        print(current)
//        if start === current {
//            return 1
//        }
//
//        return 1 + (self.next?.total(start: start, current: current?.next) ?? 0)
//    }
//
//    func remove() {
//        self.prev?.next = self.next
//        self.next?.prev = self.prev
//    }
//
//    func pushAfter(_ value: StateValue) -> StateNode {
//        let node = StateNode(value: value, next: self.next, prev: self)
//        self.pushAfter(node)
//        return node
//
//    }
//
//    private func pushAfter(_ node: StateNode) {
//        self.next?.prev = node
//        self.next = node
//
//    }
//
//    func pushBefore(_ value: StateValue) -> StateNode {
//        let node = StateNode(value: value, next: self.next, prev: self)
//        self.pushBefore(node)
//        return node
//    }
//
//    private func pushBefore(_ node: StateNode) {
//        self.prev?.next = node
//        self.prev = node
//    }
//}
