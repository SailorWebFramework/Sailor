//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

import Foundation

extension HTMLElement {
    public var description: String {
        "HTMLElement(type: \(type(of: self)), attributes: \(self.attributes), events: \(self.events), content: \(self.content))"
    }
    
}
