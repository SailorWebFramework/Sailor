//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

public final class SailboatGlobal {
    // TODO: this isnt a singleton name it manager instead
    public static var shared: (any TargetManager)! = nil
    
    public static func initialize(_ sailboatManager: any TargetManager) {
        shared = sailboatManager
    }
}
