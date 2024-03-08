//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/27/24.
//

import Sailboat
//
//final class JSNodeRenderer: Renderable {
//
//    typealias Node = JSNode
//    
//    var jsNode: Node?
//    
//    var managedPage: ManagedPage {
//        SailorGlobal.manager.managedPage
//    }
//    
//    var thisPage: (any Element)? {
//        managedPage.currentElement?.page as? any Element
//    }
//    
//    var parentPage: (any Element)? {
//        managedPage.parentElement?.page as? any Element
//    }
//    
//    public init(tag: String = "div") {
//        jsNode = Node(named: tag, events: [:])
//    }
//    
//    func addToParent(_ parentNode: Node) {
////        jsNode?.addChild(childNode)
//
//    }
//    
//    func addChild(_ childNode: Node) {
//        jsNode?.addChild(childNode)
//    }
//    
//    func remove() {
//        self.jsNode?.removeFromDOM()
//    }
//    
//    func replace(with renderable: Node) {
////        self.jsNode?
//    }
//    
//    func addAttribute(name: String, value: String) {
//        jsNode?.addAttribute(name: name, value: value)
//    }
//    
//    func addEvent(name: String, value: @escaping (Sailboat.EventResult) -> Void) {
//        jsNode?.addEvent(name: name, closure: value)
//
//    }
//    
//    
////    func render() {
////
////
//////        thisPage?.renderer
//////        if let parentRenderer = thisPage?.renderer {
//////
//////        } else {
//////
//////        }
////    }
//    
//    //    func update(attributes: [String : String]) {
//    //
//    //    }
//    //MARK - Special sailor events managed through the renderer
//    
////    func onAppear() {
////
////    }
////
////    func onDisappear() {
////
////    }
////
////    func onUpdate() {
////
////    }
//    
//}
