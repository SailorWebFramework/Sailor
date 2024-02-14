//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/13/24.
//


internal enum RouterUtils {
    
    public static var url: String {
        JSNode.window.location.object!.href.string!
    }
    
    public static func parseAndVerify(path: String) -> Bool {
//        if path == "/" {
//            return cleanPath(path: url)
//        }
        return Self.cleanPath(path: url) == path
    }

    public static func cleanPath(path: String) -> String {
        let tmp = path.split(separator: "/")
        // print("tmp: \(tmp)")
        // remove "http:" and "localhost:8080" from the path
        let cleaned = tmp.dropFirst(2).joined(separator: "")
        if cleaned == "" {
            return "/"
        }
        return cleaned
        //url.replacingOccurrences(of: "http://localhost:8080", with: "")
    }
}
