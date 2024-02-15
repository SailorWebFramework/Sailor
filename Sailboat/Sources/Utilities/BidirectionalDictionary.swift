//
//  BidirectionalDictionary.swift
//  
//
//  Created by Joshua Davis on 2/15/24.
//

public struct BidirectionalDictionary<Key: Hashable, Value: Hashable>: Hashable, ExpressibleByDictionaryLiteral {
    private var keyToValue: [Key: Value] = [:]
    private var valueToKey: [Value: Key] = [:]

    // Required initializer for ExpressibleByDictionaryLiteral
    public init(dictionaryLiteral elements: (Key, Value)...) {
        for (key, value) in elements {
            insert(key: key, value: value)
        }
    }
    // Subscript for accessing/setting values by key.
    public subscript(key key: Key) -> Value? {
        get {
            return keyToValue[key]
        }
        set {
            if let value = newValue {
                insert(key: key, value: value)
            } else {
                removeByKey(key: key)
            }
        }
    }

    // Subscript for accessing/setting keys by value.
    public subscript(value value: Value) -> Key? {
        get {
            return valueToKey[value]
        }
        set {
            if let key = newValue {
                insert(key: key, value: value)
            } else {
                removeByValue(value: value)
            }
        }
    }

    // Insert a key-value pair into the dictionary.
    public mutating func insert(key: Key, value: Value) {
        keyToValue[key] = value
        valueToKey[value] = key
    }

    // Remove a key-value pair using a key.
    public mutating func removeByKey(key: Key) {
        if let value = keyToValue.removeValue(forKey: key) {
            valueToKey.removeValue(forKey: value)
        }
    }

    // Remove a key-value pair using a value.
    public mutating func removeByValue(value: Value) {
        if let key = valueToKey.removeValue(forKey: value) {
            keyToValue.removeValue(forKey: key)
        }
    }
    
}
