//
//  JSNode+Global.swift
//  
//
//  Created by Joshua Davis on 3/9/24.
//

import JavaScriptKit

//MARK- Global
extension JSNode {
//    typealias JSAttributes = [String: String]

    static let window = JSObject.global.window.object!
    static let document = JSObject.global.document
    static let body: JSObject = document.body.object!
    static let head: JSObject = document.head.object!
    
    static let Event: JSObject = window.Event.function!
    
    var tagName: String? {
        element.tagName.string
    }

    var content: String? {
        self.element.textContent.string
    }

    var nodeType: Int {
        let number = element.nodeType.number
        return Int(number ?? -1)
    }
    
    public enum SpecialJSNodeType {
        case head
        case body
        
        func getJSObject() -> JSObject {
            switch self {
            case .head:
                JSNode.head
            case .body:
                JSNode.body
            }
        }
    }
    
    static func callEvent(named eventName: String, on object: JSObject) {
        // if the event exists
//        if self.events[eventName] != nil {
        let Event = JSObject.global.window.object?.Event.function!

        /// Set properties on the eventInit object
        let eventInit: JSObject = JSObject.global.Object.function!.new()
        eventInit.bubbles = .boolean(false)
        eventInit.cancelable = .boolean(true)
                    
        let event = Event!.new(
            eventName,
            eventInit
        )

        object.dispatchEvent.function!.callAsFunction(this: object, event)
        
            
//            element.dispatchEvent.function!.callAsFunction(this: self.element, event)
//        }
    }
    
    
    public static func deeplyLaunchEvents(from element: JSObject, _ launcher: @escaping (JSObject) -> Void) {
        
        
        var total = Int(element.childNodes.length.number!)
        
        print("launching \(total) events on...")
        for i in 0..<total {
            if let child = element.childNodes[i].object {
                deeplyLaunchEvents(from: child, launcher)
            }
        }
        
        launcher(element)
    }

}
