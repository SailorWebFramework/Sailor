//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

private struct HTMLPageWrapper<T: Page>: Page {
    var page: T

    var body: some Page {
        page
    }
}

/// Manager used for testing, does not render to DOM
open class DefaultManager: TargetManager {
    public var body: PageNode? = nil
    public var head: PageNode? = nil

    public init() { }
    
    open func build<GenericPage: Page>(page: GenericPage) {
        if page is any Element {
            self.body = CustomNode(page: HTMLPageWrapper(page: page))

        } else if page is any Operator {
            fatalError("root page must not be an operator")
            
        } else {
            self.body = CustomNode(page: page)
            
        }
        _ = CustomNode.build(page: self.body!.page.body, parent: self.body!)

        self.body?.printNode()

    }
    
    open func update() {
        guard let body = self.body else { return }
        
        update(node: body, with: body.page)
        
        self.body?.printNode()
    }
    
}
