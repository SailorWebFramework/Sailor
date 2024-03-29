// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+FormEncType.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public enum FormEncType: Equatable, CustomStringConvertible {
        ///The form data is URL encoded.
        case `applicationXWwwFormUrlencoded`
        
        ///The form data is sent as a multipart form.
        case `multipartFormData`
        
        ///The form data is sent as plain text.
        case `textPlain`
        
        public var description: String {
            switch self {
            case .applicationXWwwFormUrlencoded:
                return "application/x-www-form-urlencoded"
            case .multipartFormData:
                return "multipart/form-data"
            case .textPlain:
                return "text/plain"
            }
        }
    }
}