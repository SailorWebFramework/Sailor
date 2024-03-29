// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+AlignItems.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public enum AlignItems: Equatable, CustomStringConvertible {
        ///Aligns the items to the baseline.
        case `baseline`
        
        ///Aligns the items in the center.
        case `center`
        
        ///Aligns the items at the end.
        case `flexEnd`
        
        ///Aligns the items at the start.
        case `flexStart`
        
        ///Stretches the items to fill the container.
        case `stretch`
        
        public var description: String {
            switch self {
            case .baseline:
                    return "baseline"
            case .center:
                    return "center"
            case .flexEnd:
                    return "flex-end"
            case .flexStart:
                    return "flex-start"
            case .stretch:
                    return "stretch"
            }
        }
    }
}