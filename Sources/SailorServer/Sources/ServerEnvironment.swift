//
//  ServerEnvironment.swift
//
//  Created by Sailor Codegen.
//

import Sailboat
import SailorShared

/// Server-side environment for SSR — provides request context.
@MainActor
public final class ServerEnvironment: @preconcurrency SailorEnvironment {

    /// The URL being rendered (set from the incoming request)
    public var url: String

    public init() {
        self.url = "/"
    }

    public init(url: String) {
        self.url = url
    }
}
