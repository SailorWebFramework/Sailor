//
//  ValueElement.swift
//
//
//  Created by Joshua Davis on 3/15/24.
//


public protocol ValueElement: Element {
    
    associatedtype Value: Equatable, CustomStringConvertible
    
    var value: Value { get }
}
