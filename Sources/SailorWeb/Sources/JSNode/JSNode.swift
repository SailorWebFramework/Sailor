//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/1/24.
//

import JavaScriptKit
import Sailboat
import SailorShared

@MainActor
public final class JSNode {

    ///
    public var sailboatID: SailboatID?

    private enum Origin {
        case tag(String)
        case existing(JSObject)
    }

    private let origin: Origin

    /// The DOM node, created on first use. Element structs are rebuilt on every
    /// render and most are discarded by reconcile, so creating the node eagerly in
    /// `init` was one `document.createElement` bridge call per discarded struct.
    @_spi(Private) public lazy var element: JSObject = {
        switch origin {
        case .existing(let object):
            return object
        case .tag(let name):
            guard let created = Self.document.createElement(name).object else {
                fatalError("could not create <\(name)>")
            }
            return created
        }
    }()

    public convenience init(_ type: SpecialJSNodeType, sid: SailboatID? = nil) {
        self.init(origin: .existing(type.getJSObject()), sid: sid)
    }
    
    public convenience init(named name: String, sid: SailboatID? = nil) {
        self.init(origin: .tag(name), sid: sid)
    }
    
    private init(origin: Origin, sid: SailboatID? = nil) {
        self.origin = origin
        self.sailboatID = sid
    }

    internal func appendContent(text: String) {
        let newTextNode = Self.document.createTextNode(JSValue.string(text))
        _ = self.element.appendChild?(newTextNode)
        
        // TODO: get \t to work?
        // TODO: \n not working because changing the deep index of text nodes
//        let parts = text.components(separatedBy: "\n")
//        for (i, part) in parts.enumerated() {
//            if i > 0 {
//                let br = Self.document.createElement("br")
//                _ = self.element.appendChild?(br)
//            }
//            
//            let textNode = Self.document.createTextNode(JSValue.string(part))
//            _ = self.element.appendChild?(textNode)
//        }
        
    }

}
