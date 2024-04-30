//
//  File.swift
//  
//
//  Created by Joshua Davis on 4/17/24.
//

import Sailboat

extension Page {
    /// Unique key used when building for loops
    func key(_ completion: @escaping () -> any AttributeValue) -> any Element {
        traversePage(self) {
            $0.key {
                completion()
            }
        }
    }
}
