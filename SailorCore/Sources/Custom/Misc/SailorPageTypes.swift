//
//  ElementTypes.swift
//
//
//  Created by Joshua Davis on 3/18/24.
//

import Sailboat

/// This element can be placed in the head of the component
protocol HeadElement: Element, HeadPage {}

///
public protocol HeadPage: Sailboat.Page {}

///
protocol BodyElement: Element, BodyPage {}

/// This element can be placed in the body
public protocol BodyPage: Sailboat.Page {}


// TODO: make this conform to Page not ELement and change Website
///
public protocol Body: Element { }

///
public protocol Head: Element {
    var content: () -> any Fragment { get set }
}
