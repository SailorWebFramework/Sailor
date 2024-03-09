//
//  Renderable.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Foundation

public protocol Renderable {

    func addToParent(_ parentNode: any Renderable)

    func addChild(_ childNode: any Renderable)

    func remove()
    
    func replace(with renderable: any Renderable)
    
    func render(page: any Element)
    
    func updateAttribute(name: String, value: String)
    
    // TODO: reRenderBody ?
    
    // TODO: renderText
    
//    func addEvent(name: String, closure: @escaping (EventResult) -> Void)
    
    func debugPrint()
}
