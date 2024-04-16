//
//  Renderable+Build.swift
//
//
//  Created by Joshua Davis on 3/15/24.
//

public extension Renderable {
    
    ///
    internal func build(_ newContent: any Page, after index: Int) -> Int {
        var newIndex = index
        
        if let newContent = newContent as? any Element {
            
            RenderableUtils.build(newContent)

            if newIndex != -1 {
                newContent.renderer.insertAfter(newIndex, parent: self)
            } else {
                newContent.renderer.insertBefore(0, parent: self)
            }
            
            newIndex += 1
            
        } else if let newContent = newContent as? any Fragment {
            for child in newContent.children {
                newIndex = build(child, after: newIndex)
            }
            
        } else {
            newIndex = build(newContent.body, after: newIndex)
            
        }
        
        return newIndex
    }
    
    internal func renderAttributes(_ attributes: [String: () -> any AttributeValue]) {
        for (name, value) in attributes {
            self.updateAttribute(name: name, value: value())
            
            let states = SailboatGlobal.manager.dump()
            
            guard !states.isEmpty else { continue }

            let sailboatID: String
            
            // register sailboat ID if it doesnt already exist
            if self.sid == nil {
                sailboatID = SailboatGlobal.managedPages.createSailboatID()
                self.setSailboatID(sailboatID)
                SailboatGlobal.manager.managedPages.renderers[sailboatID] = self

            } else {
                // TODO: forcing this
                sailboatID = self.sid!
            }
            
            // if its a stateful element it should have an ID
            for stateID in states {
                SailboatGlobal.manager.managedPages.attributes[stateID, default: []].insert(
                    .init(sid: sailboatID, action: value, name: name)
                )
            }
        }
    }
    
    internal func renderEvents(_ events: [String: (EventResult) -> Void]) {
        for (name, event) in events {
            self.addEvent(name: name, value: event)
        }
    }

    
}
