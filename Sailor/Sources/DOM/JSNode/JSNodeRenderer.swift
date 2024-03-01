//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/27/24.
//

import Sailboat

final class JSNodeRenderer: Renderable {
    
    var jsNode: JSNode?
    
    public init() {
        jsNode = nil
    }
    
    func render() {
        
    }
    
    func remove() {
        
    }
    
    func replace(with renderable: Sailboat.Renderable) {
        
    }
    
    func update(attributes: [String : String]) {
        
    }
    
    func addAttribute(name: String, value: String) {
        
    }
    
    func addEvent(name: String, value: (Sailboat.EventResult) -> Void) {
        
    }
    
    //MARK - Special sailor events managed through the renderer
    
    func onAppear() {
        
    }
    
    func onDisappear() {
        
    }
    
    func onUpdate() {
        
    }
    
}
