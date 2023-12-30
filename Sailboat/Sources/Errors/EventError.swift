//
//  EventError.swift
//  
//
//  Created by Joshua Davis on 11/24/23.
//

import Foundation
import Sailboat

enum EventError: Error {
    case eventNotFound
    case eventNotModifiedForCustomComponent(Any, String)
    case eventInvalid
}

extension EventError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .eventNotFound:
            return "event not found."
        case .eventNotModifiedForCustomComponent(let object, let fname):
            return "You must override '\(fname)' in a custom page '\(type(of: object))' to use event."
        case .eventInvalid:
            return "Event invalid for current page."
        }
    }
}
