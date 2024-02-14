//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

// TODO: maybe rename to TargetManager
public protocol TargetManager {
    
    /// global state accessable from any element must be unique type?
    //static var environment: StateNode = StateNode(value: Date().timeIntervalSince1970)
    
    var environment: (any SomeEnvironment)? { get set }
    var body: PageNode? { get set }
    var head: PageNode? { get set }

    func build<GenericPage: Page>(page: GenericPage)
    func update()
}
