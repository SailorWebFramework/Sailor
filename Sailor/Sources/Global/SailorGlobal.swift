//
//  SailorGlobal.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation
import JavaScriptKit
import Sailboat

// TODO: make a singleton?
final class SailorGlobal {
    // TODO: css files
    // static var css: [String:Style] = [:]
    
    public static let document = JSObject.global.document
    public static let head = JSObject.global.head

    public static let console = JSObject.global.console

    public static let documentBody = document.body.object // TODO: should i force this
    
    public static var sailboatMananger: any AppManager {
        SailboatGlobal.shared
    }
        
    /// root node of the HTML body in memory as the virtual dom
    internal static var bodyNode: CustomNode? {
        sailboatMananger.body
    }
    
    ///
    internal static var headNode: CustomNode? {
        sailboatMananger.head
    }

}
