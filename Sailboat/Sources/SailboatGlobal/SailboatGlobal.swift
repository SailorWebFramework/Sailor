//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

public final class SailboatGlobal {
    // TODO: this isnt a singleton name it manager instead
    public static var shared: (any AppManager)! = nil
    
    public static func initialize(_ sailboatManager: any AppManager) {
        shared = sailboatManager
    }
}
