// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Time.swift
//
//  Created by Joshua Davis.
//

import Foundation
import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

/// The time element represents either a time on a 24-hour clock or a precise date in the Gregorian calendar (with optional time and timezone information).
public struct Time: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "time" }

    /// attributes associated with this type
    public var attributes: [String: () -> any AttributeValue]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: () -> any Fragment

    public var renderer: any Renderable
    
    internal init(bodyValue: (() -> any Fragment)?) {
        self.attributes = [:]
        self.events = [:]
        self.content = bodyValue ?? { List() }
        #if os(WASI)
        self.renderer = JSNode(named: Self.name)
        #else
        self.renderer = EmptyRenderer()
        #endif
    }

    public init() {  
        self.init(bodyValue: nil)
    }
    public init(@PageBuilder _ content: @escaping () -> any Fragment) {
        self.init(bodyValue: content)
    }


}

// MARK: - Attributes
public extension Time {
    ///The date and time the element represents.
    func `datetime`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "datetime", value: { value().description }))
    }

}