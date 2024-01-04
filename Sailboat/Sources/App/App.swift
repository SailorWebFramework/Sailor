//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/26/23.
//

// TODO: maybe put this into sailor not sailboat?
public protocol App {
    static func main()
    
    associatedtype AppBody: Page
    var body: AppBody { get }
    
    init()
    
}

extension App {
    public static func main() {
//        SailboatGlobal.shared = DefaultManager()
        SailboatGlobal.initialize(DefaultManager())
        SailboatGlobal.shared.build(app: Self())
    }
}
