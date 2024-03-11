//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/10/24.
//

import Foundation

public class ObservableObject: Equatable {
    public static func == (lhs: ObservableObject, rhs: ObservableObject) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: String = UUID().uuidString
}
