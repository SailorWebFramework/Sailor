//
//  a.swift
//
//
//  Created by Joshua Davis on 3/12/24.
//

import SwiftSyntax
import SwiftSyntaxMacros

// Blocked , macros not supported in SwiftWASM

// TODO: macro to wrap values in a closure

// A(href: #bind("www.\(website).com")) { "press me!" }

// OR could make macros for initializers?
// A { "press me!" }
//   .href(#bind("www.\(website).com"))
// OR
// #a(href: "www.\(website).com") { "press me!" }



