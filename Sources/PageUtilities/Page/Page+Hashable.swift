//
//  File.swift
//  
//
//  Created by Joshua Davis on 11/24/23.
//

import Foundation

public func ==(lhs: any Page, rhs: any Page) -> Bool {
    lhs.hashValue == rhs.hashValue
}

//MARK- Equatable, Hashable
extension Page {

    // public static func ==(lhs: any Page, rhs: any Page) -> Bool {
    //     lhs.equals(to: rhs)
    // }

    // public static func !=(lhs: any Page, rhs: any Page) -> Bool {
    //     !lhs.equals(to: rhs)
    // }

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(body)
        // for (key, value) in attributes {
        //     hasher.combine(key)
        //     hasher.combine(value)
        // }

    }
}
