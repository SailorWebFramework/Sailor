//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat

public final class SailorWebManager: TargetManager {
    
    public init() {
        super.init(WebEventScheduler())
        self.environment = WebEnvironment()
        
    }
    
}
