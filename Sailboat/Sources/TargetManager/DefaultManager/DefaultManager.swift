//
//  DefaultManager.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

//private struct HTMLPageWrapper<T: Page>: Page {
//    var page: T
//
//    var body: some Page {
//        page
//    }
//}

public struct ManagedEvent:Hashable {
    public static func == (lhs: ManagedEvent, rhs: ManagedEvent) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    var isStarted: Bool = false
    var isCompleted: Bool = false
    var currentState: String? = nil // State ID
    var currentPage: (any Page)? = nil
    var states: [String] = []
    
    public func hash(into hasher: inout Hasher) {
//        hasher.combine()

        for state in states {
            hasher.combine(state)
        }
    }

}

/// Manager used for testing, does not render to DOM
open class DefaultManager: TargetManager {
    public var body: PageNode? = nil
    public var environment: (any SomeEnvironment)? = nil
    
    // TODO: state objects here, or inside of environment
//    public var objects: [String: String] = [:]
    
//    public var states: [UnsafePointer: String] = [:]
//    public var event: ManagedEvent = .init()

    public init() { }
    
    private struct HTMLPageWrapper<T: Page>: Page {
        var page: T

        var body: some Page {
            page
        }
    }
    
    open func build<GenericPage: Page>(page: GenericPage) {
        if page is any Element {
            self.body = CustomNode(page: HTMLPageWrapper(page: page))

        } else if page is any Operator {
            fatalError("root page must not be an operator")
            
        } else {
            self.body = CustomNode(page: page)
            
        }
        _ = Self.build(page: self.body!.page.body, parent: self.body!)

        self.body?.printNode()

    }
    
    open func update() {
        guard let body = self.body else { return }
        
        update(node: body, with: body.page)
        
        self.body?.printNode()
    }
    
}
