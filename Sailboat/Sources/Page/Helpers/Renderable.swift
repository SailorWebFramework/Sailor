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
    
    /// add this element below another element
    func addBelow(_ node: any Element)
    
    /// remove this element permenately
    func remove()
    
    /// remove all attributes
    func clearAttributes()
    
    /// remove all events
    func clearEvents()

    /// remove the children elements from being rendered
    func clearBody()
    
    /// diff and reconcile and rebuild the body of the current element
//    func reconcile(with operator: any Operator)
    
    /// build the body of the current element
//    func build(with operator: any Operator)
    
    // TODO: maybe rename to shallow render?
    /// replace this node with another element
    func replace(with renderable: any Element)
    
    ///
    func replace(at: Int, with: any Element)
    
    /// shallow render of an element
    func render()
    
    /// update the specified attribute
    func updateAttribute(name: String, value: String)
    
}
