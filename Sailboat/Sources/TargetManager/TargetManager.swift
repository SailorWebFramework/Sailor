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
    
    var body: PageNode? { get set }
    var head: PageNode? { get set }

//    func build(app: any App)
//    func build(page: any Page)
    func build<GenericPage: Page>(page: GenericPage)
    func update()
}

//extension GlobalDOMManager {
//    
//    /// updates the global state, override this to diff DOM
//    public func update(state: StateNode, newValue: StateValue) {
//        state.value = newValue
//        
//        update()
//    }
//}
