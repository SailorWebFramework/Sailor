//
//  StylePack.swift
//  
//
//  Created by Joshua Davis on 4/9/24.
//

public protocol StyleSheet: StyleAdjacent {
    associatedtype PackedBody: StyleAdjacent, CustomStringConvertible
    var body: PackedBody { get }
    
}
