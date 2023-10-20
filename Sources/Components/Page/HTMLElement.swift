//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import SwiftSoup
import JavaScriptKit

//TODO: replace usage of soup with JSKIT
protocol HTMLElement: Page {
    var element: Element { get set }
    var children: [any Page] { get set }
    var content: String { get set }
}

extension HTMLElement {
    // TODO: make description work instead of render?
    public var description: String { "TODO" }
    
    // TODO: a little cringe
    public func render(id: String? = nil) -> String {
        let tabs = String(repeating: " ", count: id?.count ?? 0)
        var output = "\(tabs)<\(self.element.tagName()) \(id == nil ? "" : "id=\"\(id ?? "")\"")"
        
        if !self.attributes.isEmpty {
            output += " \(self.attributes.render())"
        }
        
        output += ">\n"

        if !self.content.isEmpty {
            output += "\(self.content.description)\n\(tabs)</\(self.element.tagName())>\n"
            
        } else if children.count > 0 {
            var outputChildren = ""
            
            for (i, page) in children.enumerated() {
                outputChildren.append(page.render(id: (id ?? "") + ":\(i)") + "\n")
            }
            
            output += "\(outputChildren)\n\(tabs)</\(self.element.tagName())>\n"
            
        }
        
        return output
    }
    
    public func build(parent: Element? = nil) {
        do {
            // TODO: base URI?
            // add attributes
            for (key, value) in self.attributes {
                try element.attr(key.description, value.description)
            }
            
//            try element.attr("id", (try? parent?.attr("id")) ?? "")
                        
            // add content
            if !self.content.isEmpty {
                try element.text(self.content)
            }

            // add to parent
            try parent?.appendChild(element)
            
            // loop over children component if any
            for (i, child) in children.enumerated() {
                if let childHTML = child as? (any HTMLElement) {
                    try childHTML.element.attr("id", "\((try? element.attr("id")) ?? ""):\(i)")
                }
                
                child.build(parent: element)

            }
                        
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
    public func onClick(_ completion: @escaping () -> Void) {
        
        // TODO: elementID?
//        var elementID = "1"
//        let updateButton = App.document.getElementById(elementID).object!
//        _ = updateButton.addEventListener!("click") { _ in
//            completion()
//        }
        
        
    }
}
