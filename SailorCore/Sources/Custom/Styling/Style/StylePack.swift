//
//  File.swift
//  
//
//  Created by Joshua Davis on 4/9/24.
//

protocol StylePack: StyleAdjacent {
    associatedtype PackedBody
    var body: PackedBody { get }
    
}
