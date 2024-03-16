//
//  Renderable.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

public protocol Renderable {
    
    var elementID: ElementID { get set }

    /// add this element to the parent element
    func addToParent(_ parent: any Element)
    
    ///
    func insertAfter(_ deepIndex: Int, parent: any Element)
    
    ///
    func insertBefore(_ deepIndex: Int, parent: any Element)

    /// remove this element permenately
    func remove()
    
    ///
    func remove(at deepIndex: Int)
    
    /// remove all attributes
    func clearAttributes()
    
    /// remove all events
    func clearEvents()

    /// remove the children elements from being rendered
    func clearBody()
    
    // TODO: maybe rename to shallow render?
    /// replace this node with another element
//    func replace(with renderable: any Element)
    
    ///
    func replace(at: Int, with: any Element)
    
    /// shallow render of an element
    func render()
    
    // TODO:
//    func renderAttributes()
    
//    func renderEvents()
    
    /// update the specified attribute
    func updateAttribute(name: String, value: String)
    
}
