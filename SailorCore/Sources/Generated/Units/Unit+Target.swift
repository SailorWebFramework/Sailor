// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Target.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public enum Target: Equatable, CustomStringConvertible {
        ///Opens the link in a new window or tab.
        case `blank`
        
        ///Opens the link in the same frame as it was clicked.
        case `self`
        
        ///Opens the link in the parent frame.
        case `parent`
        
        ///Opens the link in the full body of the window.
        case `top`
        
        public var description: String {
            switch self {
            case .blank:
                return "_blank"
            case .self:
                return "_self"
            case .parent:
                return "_parent"
            case .top:
                return "_top"
            }
        }
    }
}