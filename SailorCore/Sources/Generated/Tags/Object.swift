// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Object.swift
//
//  Created by Joshua Davis.
//

import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

/// The object.
public struct Object: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "object" }

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


}

// MARK: - Attributes
public extension Object {
    ///The URL of the resource.
    func `data`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "data", value: { value().description }))
    }

    ///The form element that the object element is associated with (its form owner).
    func `form`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "form", value: { value().description }))
    }

    ///The height of the object's frame.
    func `height`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "height", value: { value().description }))
    }

    ///The name of the object.
    func `name`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "name", value: { value().description }))
    }

    ///The type of the resource.
    func `type`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "type", value: { value().description }))
    }

    ///The width of the object's frame.
    func `width`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "width", value: { value().description }))
    }

}