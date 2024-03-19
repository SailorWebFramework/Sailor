//
//  EventResult.swift
//
//
//  Created by Joshua Davis on 12/17/23.
//

public enum EventResult {
    case string(String),
         float(Double),
         bool(Bool),
         int(Int),
         none // TODO: rename to empty to not conflict with optional
}
