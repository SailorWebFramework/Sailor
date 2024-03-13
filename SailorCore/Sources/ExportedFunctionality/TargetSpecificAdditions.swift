//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/13/24.
//

import Sailboat

#if os(WASI)
import SailorWeb

public typealias Environment<EnvValue> = Sailboat.Environment<WebEnvironment, EnvValue>

#else
//
#endif

extension Page {
#if os(WASI)
    public var alert: (_ text: String) -> Void { SailorWeb.alert }
    public var confirm: (_ text: String) -> Bool { SailorWeb.confirm }
    public var prompt: (_ text: String) -> String { SailorWeb.prompt }
    public var setTimeout: (_ amount: Int, _ completion: @escaping () -> Void) -> Int { SailorWeb.setTimeout }
    public var clearTimeout: (_ timeoutID: Int) -> Void { SailorWeb.clearTimeout }

#else
    public var alert: (_ text: String) -> Void { fatalError("not implemented yet") }
    public var confirm: (_ text: String) -> Bool { fatalError("not implemented yet") }
    public var prompt: (_ text: String) -> String { fatalError("not implemented yet") }
    public var setTimeout: (_ amount: Int, _ completion: @escaping () -> Void) -> Int { fatalError("not implemented yet") }
    public var clearTimeout: (_ timeoutID: Int) -> Void { fatalError("not implemented yet") }

#endif

}

