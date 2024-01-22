//
//  HTMLElement.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

// TODO: REMOVE TAGCONTENT AND MAKE IT USE BODY AND CONTENT AS TEXT
public enum TagContent: Equatable {
    public static func == (lhs: TagContent, rhs: TagContent) -> Bool {
        if case let .text(lhsString) = lhs,
           case let .text(rhsString) = rhs
        {
            return lhsString == rhsString
        }
        
        if case let .list(_) = lhs,
           case let .list(_) = rhs
        {
            // TODO: This is a little odd, TagContent should just be text and body should be the makeList
            return true
        }
        
        return false
    }
    
    case text(String), list(() -> any Operator)
}

// TODO: THIS but maybe also allow multiple events of one type?
//typealias Events = [String: (EventResult) -> Void]

public protocol HTMLElement: Page {
    
//    associatedtype AttributeType: Attributable

    /// HTML tag name, all lowercased
    var name: String { get }
    
    /// attributes on HTML tag
    var attributes: [String: String] { get set }
    
    /// event names and values attached to this HTMLElement
    var events: Events { get set }
    
    /// content within HTML tags
    var content: TagContent { get set }

    ///
//    func attribute(_ value: any Attributable) -> Self
    
}

