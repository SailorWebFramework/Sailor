//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Foundation

extension Unit {
    public enum Dimention: CSSValue, AttributeValue, Equatable {
        case px(Double),
             pct(Double),
             em(Double), rem(Double),
             vw(Double), vh(Double),
             vmin(Double), vmax(Double),
             ch(Double), ex(Double),
             cm(Double), mm(Double), inch(Double), pt(Double), pc(Double),
             empty
        
        public func render() -> String {
            switch(self) {
            case .px(let amt):
                return "\(amt)px"
            default:
                return ""
            }
        }
    }
}
