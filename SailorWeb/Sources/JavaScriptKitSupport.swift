//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/27/24.
//

import JavaScriptKit

// JavascriptKit Passthrough
// TODO: maybe scope these in Page

public func alert(_ text: String) { JSObject.global.alert.function?(text) }

public func confirm(_ text: String) -> Bool { JSObject.global.confirm.function?(text).boolean ?? false }

public func prompt(_ text: String) -> String { JSObject.global.prompt.function?(text).string ?? "" }

public func setTimeout(_ amount: Int, completion: @escaping () -> Void) -> Int {
    Int(
        JSObject.global.setTimeout.function!(JSClosure { _ in
            completion()
            return .undefined
        }, amount).number ?? 0.0
    )
}

public func clearTimeout(_ timeoutID: Int) {
    JSObject.global.clearTimeout.function!(Double(timeoutID))
}
