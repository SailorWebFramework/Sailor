//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

public final class SailboatGlobal {
    //TODO: a little gross force unwrapping
    public static var manager: (any TargetManager)! = nil
        
    public static func initialize(
        _ sailboatManager: any TargetManager
    ) {
        Self.manager = sailboatManager
    }

}
