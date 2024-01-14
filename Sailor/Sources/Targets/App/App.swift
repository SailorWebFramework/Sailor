//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/26/23.
//

import Sailboat

// TODO: REMOVE THIS? This will be for other App targets down the road if this project evolves
private protocol App {
    static func main()
    
    associatedtype AppBody: Page
    var body: AppBody { get }
    
    init()
    
}

//extension App {
//    
//    public static func main() {
//        SailboatGlobal.initialize(SailorManager())
//        SailboatGlobal.shared.build(app: Self())
//    }
//}


//extension App {
//    public static func main() {
//        SailboatGlobal.initialize(DefaultManager())
//        SailboatGlobal.shared.build(page: Self().body)
//    }
//}
