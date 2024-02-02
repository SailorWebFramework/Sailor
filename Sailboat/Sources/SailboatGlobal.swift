//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

public final class SailboatGlobal {
    public static var manager: (any TargetManager)! = nil
    
    public static func initialize(_ sailboatManager: any TargetManager) {
        manager = sailboatManager
    }
}
