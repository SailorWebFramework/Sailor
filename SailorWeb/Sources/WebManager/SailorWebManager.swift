//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat

public final class SailorWebManager: TargetManager {
    
    public override init() {
        super.init()
        self.environment = WebEnvironment()
        
    }
    
}
