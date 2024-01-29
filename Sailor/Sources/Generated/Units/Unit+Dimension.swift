//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

// AttributeValue
extension Unit {
    public enum Dimention: CSSValue, Equatable {
        public var description: String {
            switch(self) {
            case .px(let amt):
                return "\(amt)px"
            case .float(let amt):
                return "\(amt)"
            case .int(let amt):
                return "\(amt)"
            case .cm(let amt):
                return "\(amt)cm"
            default:
                return ""
            }
        }
        
        case px(Double),
             pct(Double),
             em(Double), rem(Double),
             vw(Double), vh(Double),
             vmin(Double), vmax(Double),
             ch(Double), ex(Double),
             cm(Double), mm(Double), inch(Double), pt(Double), pc(Double),
             float(Double), int(Int),
             empty
        
    }
}