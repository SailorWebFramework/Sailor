//
//  Renderable.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

public protocol Renderable {
    
    var id: ElementID { get }
    
    /// add this element to the parent element
    func addToParent(_ parent: any Element)
    
    ///
    func insertAfter(_ deepIndex: Int, parent: any Renderable)
    
    ///
    func insertBefore(_ deepIndex: Int, parent: any Renderable)

    /// remove this element permenately
    func remove()
    
    /// removes child of the current element at the deep index (including the inner of Fragments)
    func remove(at deepIndex: Int)
    
    /// remove all attributes
//    func clearAttributes()
    
    /// remove all events
//    func clearEvents()

    /// remove the children elements from being rendered
//    func clearBody()
    
    // TODO: maybe rename to shallow render?
    /// replace this node with another element
//    func replace(with renderable: any Element)
    
    ///
    func replace(at: Int, with: any Renderable)
    
    /// shallow render of an element events
    func renderEvents()
    
    /// shallow render of an element attributes
    func renderAttributes()

    /// update the specified attribute
//    func updateAttribute(name: String, value: String)
    
}
