//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import SwiftSoup

public final class PageHierarchy {
    static var shared: PageHierarchy?
    var root: any Page
    
    public init(root: some Page) {
        self.root = root
        Self.shared = self
        
    }
    
    public func render() -> Document {
        do {
            // Create a new, empty document
            let doc = Document.createShell("")
            
            self.root.build(parent: doc.body())

            print("HTML:\n", try doc.html())
            
            return doc

        } catch {
            print("Error creating HTML: \(error)")
        }
        
        return Document("")
    }
    
    public func build(loc: URL, isDebug: Bool = true) {
        var doc = render()
        do {
            if isDebug {
                try doc.head()?.append("""
                <script type="text/javascript" src="https://livejs.com/live.js"></script>
            """)
            }
            
            try doc.html().write(to: loc, atomically: true, encoding: .utf8)
        } catch {  }
    }
    
}
