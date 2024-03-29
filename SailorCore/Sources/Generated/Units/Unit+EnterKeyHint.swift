// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+EnterKeyHint.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public enum EnterKeyHint: Equatable, CustomStringConvertible {
        ///The user is done with this text field.
        case `done`
        
        ///The user is done with this text field.
        case `enter`
        
        ///The user is done with this text field.
        case `go`
        
        ///The user is done with this text field.
        case `next`
        
        ///The user is done with this text field.
        case `previous`
        
        ///The user is done with this text field.
        case `search`
        
        ///The user is done with this text field.
        case `send`
        
        public var description: String {
            switch self {
            case .done:
                    return "done"
            case .enter:
                    return "enter"
            case .go:
                    return "go"
            case .next:
                    return "next"
            case .previous:
                    return "previous"
            case .search:
                    return "search"
            case .send:
                    return "send"
            }
        }
    }
}