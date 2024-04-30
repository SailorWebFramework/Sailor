//
//  JSNode+Global.swift
//  
//
//  Created by Joshua Davis on 3/9/24.
//

import JavaScriptKit
import JavaScriptEventLoop
import Sailboat

//MARK- Global
extension JSNode {
    static let sailboatIDName = "data-sid"
    
    static let URLSearchParams = JSNode.window.URLSearchParams.function!
    static let JSON = JSObject.global.JSON
    
    static let window = JSObject.global.window.object!
    static let document = JSObject.global.document
    static let body: JSObject = document.body.object!
    static let head: JSObject = document.head.object!
    static let Event: JSObject = window.Event.function!
    static let jsFetch = JSObject.global.fetch.function!
    static let requestAnimationFrame = window.requestAnimationFrame.function!

    @available(macOS 14.0, *)
    public static func installGlobalExecutor() {
        JavaScriptEventLoop.installGlobalExecutor()
    }
    
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
    
    static func callEvent(named eventName: String, on object: JSObject, bubbles: Bool = false) {
        // if the event exists
//        if self.events[eventName] != nil {
        let Event = JSObject.global.window.object?.Event.function!

        /// Set properties on the eventInit object
        let eventInit: JSObject = JSObject.global.Object.function!.new()
        eventInit.bubbles = .boolean(bubbles)
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
        let total = Int(element.childNodes.length.number!)
        
        for i in 0..<total {
            if let child = element.childNodes[i].object {
                deeplyLaunchEvents(from: child, launcher)
            }
        }
        
        launcher(element)
    }
    
//    public static func deeplyGrabSID(from element: JSObject, _ closure: @escaping (SailboatID) -> Void) {
//        let total = Int(element.childNodes.length.number!)
//        
//        for i in 0..<total {
//            if let child = element.childNodes[i].object {
//                deeplyGrabSID(from: child, closure)
//            }
//        }
//        if let stringSailboatID = element.getAttribute?(JSNode.sailboatIDName).string,
//           let sailboatID = SailboatID(stringSailboatID) {
//            print("grabbing \(sailboatID)")
//            closure(sailboatID)
//        }
//    }

}
