//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import SwiftSoup


//public protocol P: HTMLElement {
//    init()
//    init(@PageBuilder _ content: () -> [any Page])
//    init(content: String)
//    init(children: [any Page], content: String, style: Style)
//
//}

protocol HTMLElement: Page {
    var element: Element { get set }
    var children: [any Page] { get set }
    var content: String { get set }
    

}

extension HTMLElement {
    
    public func build(parent: Element? = nil) {
        do {
            // TODO: base URI?
//            print(element.tag().toString(), parent)
            // add styles
            if !self.style.isEmpty {
                try element.attr("style", self.style.renderInline())
            }
            
            if !self.content.isEmpty {
                try element.text(self.content)
            }
            
            try parent?.appendChild(element)
            
            for child in children {
                child.build(parent: element)
            }
            
//            print("DID IT")

                        
        } catch {
            print("ERROR PARSING HTML")
        }
        
    }
}
