//
//  Img.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Foundation

extension Img {
    public init(src: String? = nil, alt: String? = nil, width: Unit.Dimention? = nil, height: Unit.Dimention? = nil) {
        self.init()
        
        if let src = src { self.attributes[.src] = src }
        if let alt = alt { self.attributes[.alt] = alt }
        if let width = width { self.attributes[.width] = width }
        if let height = height { self.attributes[.height] = height }
        
    }
}
