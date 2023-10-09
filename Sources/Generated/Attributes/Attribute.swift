//
//  Attribute.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation

//TODO: consider leaving only custom and makeing whole attribute lib using extensions and custom Attributes

// CustomStringConvertible
public enum Attribute: String, CustomStringConvertible {
    case src, style, className, alt, width, height //, custom(String)
    
    
    public var description: String { self.rawValue }
}
