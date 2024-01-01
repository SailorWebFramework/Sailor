//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Foundation
import Sailboat
import JavaScriptKit

final class SailorManager: DefaultManager {
    
    public static let document = JSObject.global.document.object!

    override public func build(page: any Page) {
        super.build(page: page)
        reconcile()
    }
    
    override public func update() {
        super.update()
        reconcile()
    }
    
    // TODO: logic to reconcile the DOMTree with the Virtual DOM
    private func reconcile() {
        guard let body = self.body else { return }

        reconcile(node: body, element: Self.document)
    }
    
}

//// TODO: remove page from diff and just verify domNodes??? mayb
//// TODO: FIX
//static func diff(page: any Page, domNode: any PageNode) {
//    print("d:", domNode, "||", "PAGE:", page)
//    print("dp:", domNode.page)
//
//    // compare and replace tag if its not the same
//    if !domNode.compareTag(to: page) {
//        print("REPLACING different node \(type(of:page)) \(type(of:domNode.page))")
//        domNode.replace(using: page)
//        return
//    }
//
//    // TODO: fix this
//    if let page = page as? any HTMLElement {
//        // if page is html element
//        print("updating HTML node: \(page)")
//        domNode.update(using: page)
//
//        switch page.content {
//        case .text(_):
//            if !domNode.children.isEmpty {
//                print("REPLACING text with HTML")
//                domNode.replace(using: page)
//                return
//            }
//        case .list(let makeList):
//            if !domNode.children.isEmpty {
//                print("DIFFING INNER OPERATOR")
//                print(domNode.children[0])
//                print("count: \(domNode.children)")
//
//                diff(page: makeList(), domNode: domNode.children[0])
//            } else {
//                print("Making new body in HTML")
//                domNode.build(child: makeList())
//            }
//        }
//
//    } else if let page = page as? any Operator {
//        // if page is operator
//        print("doing operator: \(page)")
//
//        // loop over children
//        let (oldSize, newSize) = (domNode.children.count, page.children.count)
//        let endRange = min(oldSize, newSize)
//
//        for i in 0..<endRange {
//            // #IMPORTANT if the custom pages are the same type then reuse the old page
//            print("pg13:", type(of: domNode.children[i].page), page.children[i])
//            let checkChildEqType = type(of: domNode.children[i].page) == type(of: page.children[i])
//            let checkIsCustomPage = (domNode.children[i].page as? any Operator ?? domNode.children[i].page as? any HTMLElement) == nil
//
//            if checkChildEqType {
//                print("reusing page")
//                diff(page: domNode.children[i].page, domNode: domNode.children[i])
//            } else {
//                diff(page: page.children[i], domNode: domNode.children[i])
//            }
//
//        }
//
//        // TODO: dont think this is possible currently because size never changes with conditional
//        // TODO: When creating ol items with ids and resizable will need this and have it change
//        // if old dom had more elements than new dom, delete
//        if oldSize > newSize {
//            print("REMOVING EXTRA CHILD")
//
//            for i in endRange..<oldSize {
//                domNode.children[i].removeFromDOM()
//            }
//
//        }
//
//        // if old dom had less elements than new dom, build
//        if oldSize < newSize {
//            print("ADDING EXTRA CHILD")
//            for i in endRange..<newSize {
//                domNode.build(child: page.children[i])
//            }
//
//        }
//
//    } else {
//        // if is custom page
//        print("doing custom page: \(page)")
//        // TODO: DO ERROR CHECK, should never happen though
//        // TODO: check id? or somthing
////            let index = domNode.parent?.children.first(where: { $0 == page})
////
////            domNode.parent?.children[index] = domNode.page
//
//        // uses current dom page not new one to maintain state
//        diff(page: domNode.page.body, domNode: domNode.children[0])
//
////            diff(page: page.body, domNode: domNode.children[0])
//
//    }
//
//}
