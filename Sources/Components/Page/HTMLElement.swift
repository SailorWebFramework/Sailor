//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import JavaScriptKit

public struct Element {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func tagName() -> String {
        return self.name
    }
}

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
//    public func render(id: String? = nil) -> String {
//        let tabs = String(repeating: " ", count: id?.count ?? 0)
//        var output = "\(tabs)<\(self.element.tagName()) \(id == nil ? "" : "id=\"\(id ?? "")\"")"
//
//        if !self.attributes.isEmpty {
//            output += " \(self.attributes.render())"
//        }
//
//        output += ">\n"
//
//        if !self.content.isEmpty {
//            output += "\(self.content.description)\n\(tabs)</\(self.element.tagName())>\n"
//
//        } else if children.count > 0 {
//            var outputChildren = ""
//
//            for (i, page) in children.enumerated() {
//                outputChildren.append(page.render(id: (id ?? "") + ":\(i)") + "\n")
//            }
//
//            output += "\(outputChildren)\n\(tabs)</\(self.element.tagName())>\n"
//
//        }
//
//        return output
//    }
    
//    public func build(parent: Element? = nil) {
//        do {
//            // TODO: base URI?
//            // add attributes
//            for (key, value) in self.attributes {
//                try element.attr(key.description, value.description)
//            }
//
////            try element.attr("id", (try? parent?.attr("id")) ?? "")
//
//            // add content
//            if !self.content.isEmpty {
//                try element.text(self.content)
//            }
//
//            // add to parent
//            try parent?.appendChild(element)
//
//            // loop over children component if any
//            for (i, child) in children.enumerated() {
//                if let childHTML = child as? (any HTMLElement) {
//                    try childHTML.element.attr("id", "\((try? element.attr("id")) ?? ""):\(i)")
//                }
//                child.build(parent: element)
//            }
//
//        } catch {
//            // TODO: throw meaningful errors
//            print("ERROR PARSING HTML")
//        }
//
//    }
    
    public func build(parent: JSValue) {

        do {
            var curElement = App.document.createElement(self.element.tagName())

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
    
    public func onClick(_ completion: @escaping () -> Void) {
//        getElement().onclick = .object(
//            JSClosure { _ in
//                completion()
//            }
//        )
        
//        App.document.appendChild()
        // TODO: elementID?
//        var elementID = "1"
//        let updateButton = App.document.getElementById(elementID).object!
//        _ = updateButton.addEventListener!("click") { _ in
//            completion()
//        }
        
        
        
        
        
    }
}
