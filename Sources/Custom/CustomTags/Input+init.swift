//
//  File.swift
//  
//
//  Created by Joshua Davis on 11/23/23.
//

import JavaScriptKit

extension Input {
    
    // TODO: FIX UNFOCUSED TEXT BY NOT REBUILDING THE ENTIRE VIEW
    public init(_ input: Binding<String>) {
        self.init()
        
        self.element.value = JSValue.string(input.get())

        _ = self.element.addEventListener(
            "input",
            JSClosure { event in
                guard let target = event.first?.target.value.string else {
                    return .undefined
                }
                
                input.set(target)
                
                return .undefined
            }
        )
    }
}

