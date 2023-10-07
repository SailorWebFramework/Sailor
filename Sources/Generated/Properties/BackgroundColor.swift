//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Foundation

extension Style.Property {
    static func backgroundColor(_ value: Unit.Color) -> Style.Property {
        .init(name: "background-color", value: value)
    }
    
    static func width(_ value: Unit.Dimention) -> Style.Property {
        .init(name: "width", value: value)
    }
    
    static func height(_ value: Unit.Dimention) -> Style.Property {
        .init(name: "height", value: value)
    }
}
