// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Question.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public enum Question: Equatable, CustomStringConvertible {
        ///The answer is yes.
        case `yes`
        
        ///The answer is no.
        case `no`
        
        public var description: String {
            switch self {
            case .yes:
                return "yes"
            case .no:
                return "no"
            }
        }
    }
}