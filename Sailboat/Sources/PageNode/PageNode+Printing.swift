//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/26/23.
//


extension PageNode {
    public func printNode() {
        Swift.print(self.stackString(tabs: 4))
    }
    
    private func stackString(tabs: Int = 0) -> String {
        var output = ""
        let spaces = String(repeating: " ", count: tabs)
        
        if !children.isEmpty {
            output += spaces + self.description + " {" + "\n"
            
            for child in children {
                output += child.stackString(tabs: tabs + 4)
            }
            
            output += spaces + "}," + "\n"

        } else {
            output += spaces + self.description + "\n"
        }
        return output
    }
    
}
