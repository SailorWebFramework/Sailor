//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

/// Manager used for testing, does not render to DOM
open class DefaultManager: TargetManager {
    
    public var body: CustomNode? = nil
    public var head: CustomNode? = nil

    public init() { }
    
//    open func build(app: any App) {
//        build(page: app.body)
//    }
    
    open func build(page: any Page) {
        self.body = CustomNode(page: page)
        
        _ = CustomNode.build(page: self.body!.page.body, parent: self.body!)

        self.body?.printNode()

    }
    
    open func update() {
        guard let body = self.body else { return }
        
        update(node: body, with: body.page)
        
        self.body?.printNode()
    }
    
}
