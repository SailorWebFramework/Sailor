//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/13/24.
//


internal enum RouterUtils<MyRoutes: Routes> {
    
    public static var url: String {
        JSNode.window.location.object!.href.string!
    }
    
    public static func parseAndVerify(path: String) -> Bool {
//        if path == "/" {
//            return cleanPath(path: url)
//        }
        return Self.cleanPath(path: url) == path
    }
    
    public static func currentRoute() -> MyRoutes {
        return MyRoutes.fromString(Self.cleanPath(path: url))
    }

    public static func cleanPath(path: String) -> String {
        let tmp = path.split(separator: "/")
        // print("tmp: \(tmp)")
        // remove "http:" and "localhost:8080" from the path
        var cleaned = tmp.dropFirst(2).joined(separator: "")
        
        if cleaned.first == "#" {
            cleaned = ""
        } else if let beforeHashes = cleaned.split(separator: "#").first {
            cleaned = String(beforeHashes)
        }
        
        print("CLEANED: \(cleaned)")

        if cleaned == "" {
            return "/"
        }
        return cleaned
        //url.replacingOccurrences(of: "http://localhost:8080", with: "")
    }
}
