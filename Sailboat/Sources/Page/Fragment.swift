//
//  Fragment.swift
//
//
//  Created by Joshua Davis on 12/22/23.
//

/// Operators are along the page tree and DOMNode Structure but are Hidden (not rendered) used to assist in rendering
public protocol Fragment: Page {
    
    // TODO: hash should be any Equatable or hashable for for-loop fragments
    ///
    var hash: String { get set }

    ///
    var children: [any Page] { get set }
    
}

public extension Fragment {
    var description: String {
        "Fragment(type: \(type(of: self)), children: \(children.count)"
    }

    var body: Never {
        .error()
    }
}
