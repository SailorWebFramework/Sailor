//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat

public final class SailorWebManager: DefaultManager {
    
    internal var reconcileIndexStack: [Int] = []
    

    public override init() {
        super.init()
        self.environment = WebEnvironment()
        
    }
    
    override public func build<GenericPage: Page>(page: GenericPage) {
        super.build(page: page)

    }
    
    override public func update() {
        super.update()
    }
    
    // TODO: logic to reconcile the DOMTree with the Virtual DOM
    private func reconcile() { }
    
}
