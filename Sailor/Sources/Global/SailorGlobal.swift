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
    
    public static var document = JSObject.global.document
    
    public static let console = JSObject.global.console

    public static let documentBody = document.body.object // TODO: should i force this

    /// root node of the HTML body in memory as the virtual dom
    internal static var bodyNode: CustomNode? = nil
    
    ///
    internal static var headNode: CustomNode? = nil
    
}
