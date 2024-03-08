//
//  TargetManager.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

public protocol TargetManager {

    var environment: (any SomeEnvironment)? { get set }
    var body: (any PageNode)? { get set }
    
    var elements: [ElementID: ElementNode] { get set }

    var managedEvent: ManagedEvent { get set }
    var managedPage: ManagedPage { get set }
    
    var stateCallbackHistory: [StateID] { get set }

//    /// rendered page IDs and its states
//    var renderedPages: [String: Set<Int>] { get set }
//
//    var currentPage: (any Page)? { get set }

    func build<GenericPage: Page>(page: GenericPage)
    
    func build(page: any Page, parent: (any PageNode)?) -> any PageNode 
    
    func update()
    
    func registerPageNode(_ pageNode: CustomNode)
    
    func startEvent()
    func eventAdd<StateValue: Equatable>(state: State<StateValue>)
    func endEvent()

    
    func dumpTo(element: any Element, toBody: Bool)
    func dumpTo(element: any Element)

    func dump() -> [StateID]
    func dumpDependency<StateValue: Equatable>(state: State<StateValue>)
    

    
}
