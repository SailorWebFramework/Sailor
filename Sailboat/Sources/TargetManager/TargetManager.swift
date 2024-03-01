//
//  TargetManager.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

public protocol TargetManager {

    var environment: (any SomeEnvironment)? { get set }
    var body: PageNode? { get set }
    
//    /// rendered page IDs and its states
//    var renderedPages: [String: Set<Int>] { get set }
//
//    var currentPage: (any Page)? { get set }

    func build<GenericPage: Page>(page: GenericPage)
    func update()
    
    
}
