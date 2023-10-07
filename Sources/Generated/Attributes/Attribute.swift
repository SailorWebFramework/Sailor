//
//  Attribute.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation

//TODO: consider leaving only custom and makeing whole attribute lib using extensions and custom Attributes
public enum Attribute: Equatable, Hashable {
    case src, style, className, alt, width, height, custom(String)
    
    func render() -> String {
        switch self {
        case .src: return "src"
        case .style: return "style"
        case .className: return "class"
        case .alt: return "alt"
        case .width: return "width"
        case .height: return "height"
        case .custom(let value): return value
        }
    }
}
