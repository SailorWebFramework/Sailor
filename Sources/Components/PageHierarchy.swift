//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import JavaScriptKit

public final class PageHierarchy {
    //    static var shared: PageHierarchy?
    var root: any Page
    
    public init(root: some Page) {
        self.root = root
        //        Self.shared = self
        
    }
    
    public func build(parent: JSValue) {
        print("STARTING PAGE HIERARCHY")

        self.root.build(parent: parent)

        // do {
        //     _ = App.document.appendChild(JSValue(stringLiteral: self.render()))
                        
        // } catch {
        //     // TODO: throw meaningful errors
        //     print("ERROR PARSING HTML")
        // }
    }
    
    /// renders page
//    public func render() -> Document {
//        do {
//            // Create a new, empty document
//            let doc = Document.createShell("")
//
//            try doc.body()?.append(self.root.render(id: "0"))
////            self.root.build(parent: doc.body())
//
//            print("HTML:\n", try doc.html())
//
//            return doc
//
//        } catch {
//            print("Error creating HTML: \(error)")
//        }
//
//        return Document("")
//    }
    
//    /// builds initial page to filesys
//    public func build(loc: URL, isDebug: Bool = true) {
////        let doc = render()
//        let indexhtml: URL = loc.appendingPathComponent("index.html")
//        var output = self.root.render(id: "0")
//
//        do {
//
//
//            if isDebug {
////                try doc.head()?.append("""
////                <script type="text/javascript" src="https://livejs.com/live.js"></script>
////            """)
//                output = """
//                <html>
//                 <head>
//                  <script type="text/javascript" src="https://livejs.com/live.js"></script>
//                 </head>
//                \(output)
//                </html>
//                """
//            }
//
//            try output.write(to: indexhtml, atomically: true, encoding: .utf8)
//
////            try doc.html().write(to: indexhtml, atomically: true, encoding: .utf8)
//        } catch(let error) {
//            print(error)
//        }
//
//    }
    
}
