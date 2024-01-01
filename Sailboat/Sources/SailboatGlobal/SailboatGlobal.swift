//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

import Foundation


public final class SailboatGlobal {
    public static var shared: (any AppManager)! = nil
    
    public static func initialize(_ sailboatManager: any AppManager) {
        shared = sailboatManager
    }
    
//    public static func resetShared() {
//        Self.shared = DefaultManager()
//    }
    
}
