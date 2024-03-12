//
//  JSNode+Debug.swift
//  
//
//  Created by Joshua Davis on 12/26/23.
//


extension JSNode: CustomStringConvertible {
    
    var description: String {
        """
        JSNode(type: \(tagName ?? ""), events: \(events.count), attributes: \(attributes))
        """
    }
    
    public func printNode() {
//        Swift.print(self.stackString(tabs: 4))
        Swift.print(self.description)
    }
    
//    private func stackString(tabs: Int = 0) -> String {
//        var output = ""
//        let spaces = String(repeating: " ", count: tabs)
//        
//        if !children.isEmpty {
//            output += spaces + self.description + " {" + "\n"
//            
//            for child in children {
//                output += child.stackString(tabs: tabs + 4)
//            }
//            
//            output += spaces + "}," + "\n"
//
//        } else {
//            output += spaces + self.description + "\n"
//        }
//        return output
//    }
    
}
