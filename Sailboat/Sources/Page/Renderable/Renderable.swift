//
//  Renderable.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

public protocol Renderable {
    
    /// the sailboat ID of the renderer
    var sid: SailboatID? { get set }
    
    /// add this element to the parent element
    func addToParent(_ parent: any Renderable)
    
    ///
    func insertAfter(_ deepIndex: Int, parent: any Renderable)
    
    ///
    func insertBefore(_ deepIndex: Int, parent: any Renderable)

    /// remove this element permenately
    func remove()
    
    /// removes child of the current element at the deep index (including the inner of Fragments)
    func remove(at deepIndex: Int)
    
    /// 
    func replace(at: Int, with: any Renderable)
    
    /// update the specified attribute in the renderer
    func updateAttribute(name: String, value: any AttributeValue)
    
    /// add the event to the renderer
    func addEvent(name: String, value:  @escaping (EventResult) -> Void)
    
    ///
    func setSailboatID(_ value: SailboatID?)

}
