//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import JavaScriptKit

// public struct Element {
//     var name: String
    
//     init(_ name: String) {
//         self.name = name
//     }
    
//     func tagName() -> String {
//         return self.name
//     }
// }

//TODO: replace usage of soup with JSKIT
protocol HTMLElement: Page {
    var element: JSValue { get set }
    var children: [any Page] { get set }
    var content: String { get set }
}

extension HTMLElement {
    // TODO: make description work instead of render?
    public var description: String { "TODO" }
  
    public func build(parent: JSValue) {
        do {
            var curElement = self.element

            // add content
            if !self.content.isEmpty {
                curElement.textContent = JSValue.string(self.content)
            }

            // add attributes
            for (key, value) in self.attributes {
                curElement.setAttribute(key.description, value.description)
            }

            // add children
            for (i, child) in children.enumerated() {
               child.build(parent: curElement)
            }

            // add to DOM
            _ = parent.appendChild(curElement)


        } catch {
            // TODO: throw meaningful errors
            print("ERROR PARSING HTML")
        }
    }
    
}

//MARK - Hashable
extension HTMLElement {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(content)
        
        for child in children {
            hasher.combine(child)
        }
    }
}

extension HTMLElement {
    public func getElement() -> JSValue {
        App.document
    }

    public func onClick(_ completion: @escaping () -> Void) -> any Page {
        var curElement = self.element

        curElement.onclick = .object(
            JSClosure { _ in
                completion()
            }
        )

        return self
    }
}
