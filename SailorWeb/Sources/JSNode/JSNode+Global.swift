//
//  JSNode+Global.swift
//  
//
//  Created by Joshua Davis on 3/9/24.
//

import JavaScriptKit

//MARK- Global
extension JSNode {
    typealias JSAttributes = [String: String]

    static let window = JSObject.global.window
    static let document = JSObject.global.document
    static let body: JSObject = document.body.object!
    static let head: JSObject = document.head.object!
    
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
    
    public enum JSNodeType {
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

}
