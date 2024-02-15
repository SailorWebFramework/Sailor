//
//  TargetManager.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

public protocol TargetManager {

//    var objects: (any SomeEnvironment)? { get set }
    //    var objects: (any SomeEnvironment)? { get set }
    var environment: (any SomeEnvironment)? { get set }
    var body: PageNode? { get set }
    var head: PageNode? { get set }

    func build<GenericPage: Page>(page: GenericPage)
    func update()
}
