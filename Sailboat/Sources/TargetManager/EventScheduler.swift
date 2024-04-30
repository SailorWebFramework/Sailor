//
//  ManagedEvent.swift
//
//
//  Created by Joshua Davis on 3/14/24.
//

public protocol EventScheduler {
    var states: Set<StateID> { get set }

    func registerEvent()
//    func registerEvent() -> LinkedListNode<EventNode>

    func observe(state: some Stateful)
    
    func blockUpdates()
    
    func unblockUpdates()

    func update()
//    func endEvent(_ node: LinkedListNode<EventNode>)

}


//public enum EventUrgency: UInt8 {
//    case attribute = 0
//    case animation = 1
//    case pagebody = 2
//    case asynchronous = 3
//}

//public struct EventNode {
//    public var states: Set<StateID> = []
//    public var asynchronous: Bool = false
//}
