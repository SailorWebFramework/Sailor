//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation

public protocol CSSValue {
    func render() -> String
}

public struct Style {
    public static func none() -> Style { Style() }
    
    
    // TODO: USE MIRROR
    static func + (left: Style, right: Style) -> Style {
        return right
//        return Money(value: left.value + right.value,
//                     currencyCode: left.currencyCode)
    }
    
    @propertyWrapper
    public struct Attribute<Value> {
    //    public static var shared:
        
        public let attributeName: String
        public var value: Value
        
        public var wrappedValue: Value {
            get { value }
            set { value = newValue }
        }
        
        public init(wrappedValue: Value, _ attributeName: String) {
            self.value = wrappedValue
            self.attributeName = attributeName
        }
    }
    
    @Attribute("background-color")
    public var backgroundColor: Color = .empty

    @Attribute("width") /// width of view
    public var width: Dimention = .empty

    @Attribute("height") /// height of view
    public var height: Dimention = .empty
    
    
    public var isEmpty: Bool {
        false
    }
    
    
    public init(backgroundColor: Color = .empty, width: Dimention = .empty, height: Dimention = .empty) {
        self.backgroundColor = backgroundColor
        self.width = width
        self.height = height
    }
    
    
    public func renderInline() -> String {
//        let mirror = Mirror(reflecting: self)
        
//        for child in mirror.children {
//            print(child.label, "::", child.value)
//        }
//
        var output = ""
        
//        switch(_backgroundColor.wrappedValue) {
//        case .empty: break
//        default:
//            output += "\(_backgroundColor.attributeName): \(_backgroundColor.wrappedValue.render());"
//        }
        if _backgroundColor.wrappedValue != .empty {
            output += "\(_backgroundColor.attributeName): \(_backgroundColor.wrappedValue.render());"
        }
        
        if _width.wrappedValue != .empty {
            output += "\(_width.attributeName): \(_width.wrappedValue.render());"
        }
        
        
        if _height.wrappedValue != .empty {
            output += "\(_height.attributeName): \(_height.wrappedValue.render());"
        }
        
        
//        switch(_width.wrappedValue) {
//        case .empty: break
//
//        default:
//            output += "\(_width.attributeName): \(_width.wrappedValue.render());"
//        }
        
//        switch(_height.wrappedValue) {
//        case .empty: break
//
//        default:
//            output += "\(_height.attributeName): \(_height.wrappedValue.render());"
//        }

        // TODO: maybe add attibutes to an array in Attribute as a shared resource
//        for child in mirror.children {
//            print("\(child.label ?? "unknown"): \(child.value)")
//        }
        
//        print("OUTPUT:", output)
        
        return output

    }
    
//    public func renderCSS() {
//
//    }
}
