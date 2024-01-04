//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

//MARK - Hashable
//extension HTMLElement {
//
//    // TODO: where does this go?
////    static public func ==(lhs: any Page, rhs: any Page) -> Bool {
////        rhs.description == rhs.description
////    }
//
//    public static func ==(lhs: any HTMLElement, rhs: any HTMLElement) -> Bool {
//        lhs.hashValue == rhs.hashValue
//    }
//
//    public static func ==(lhs: Self, rhs: Self) -> Bool {
//        lhs.hashValue == rhs.hashValue
//    }
//
//
//    public func hash(into hasher: inout Hasher) {
////        hasher.combine(self.content)
//        hasher.combine(self.name)
//
//        // TODO: attributes and events conformence to hashable
////        hasher.combine(self.attributes)
////        hasher.combine(self.events)
//        // TODO: should this be here
//        hasher.combine(self.children.count)
//
////        for child in children {
////            hasher.combine(child)
////        }
//    }
//}
//
//extension HTMLElement {
//
//
////    public func equals(to page: any Page) -> Bool {
////        if !outerEquals(to: page) {
////            return false
////        }
////
////        guard let otherpage = page as? any HTMLElement else {
////            return false
////        }
////
////        if otherpage.children.count != self.children.count {
////            return false
////        }
////
////        for (i, child) in children.enumerated() {
////            if !child.equals(to: otherpage.children[i]) {
////                return false
////            }
////        }
////
////        return true
////    }
//
//    // TODO: maybe this shouldnt test content because thats techinically inner?
////    public func outerEquals(to page: any Page) -> Bool {
////        if type(of: self) == type(of: page) {
////            if let page = page as? any HTMLElement {
////
////                return (
////                    page.attributes == self.attributes &&
////                    page.content == self.content
////                )
////
////               }
////        }
////
////        return false
////    }
//}
