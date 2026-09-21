//
//  File.swift
//
//
//  Created by Joshua Davis on 3/28/24.
//

import Sailboat

extension Int: @retroactive AttributeValue { }
extension String: @retroactive AttributeValue { }
extension Bool: @retroactive AttributeValue { }
extension Double: @retroactive AttributeValue { }

/// Value of an HTML boolean attribute (`disabled`, `checked`, `hidden`, …).
///
/// HTML boolean attributes are true when present and false when absent — the
/// string "false" still counts as present — so renderers must add or remove the
/// attribute rather than write "true"/"false". `description` is the canonical
/// empty value used when the attribute is present.
public struct BooleanAttribute: AttributeValue {
    public let isPresent: Bool

    public init(_ isPresent: Bool) {
        self.isPresent = isPresent
    }

    public var description: String { "" }
}
