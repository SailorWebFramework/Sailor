//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

extension DefaultManager {
    
    internal func update(node: any PageNode, with page: any Page) {
        
        print(node, "vs.", page)
        // compare and replace tag if its not the same
        if !node.compareTag(to: page) {
//            print("REPLACING different node \(type(of:page)) \(type(of:node.page))")
            node.replace(using: page)
            return
        }

        // TODO: fix this
        if let page = page as? any HTMLElement {
            // if page is html element
//            print("updating HTML node: \(page)")
            node.update(using: page)

            switch page.content {
            case .text(_):
                if !node.children.isEmpty {
//                    print("REPLACING text with HTML")
                    node.replace(using: page)
                    return
                }
            case .list(let makeList):
                if !node.children.isEmpty {
//                    print("DIFFING INNER OPERATOR")
                    print(node.children[0])
//                    print("count: \(node.children)")

                    update(node: node.children[0], with: makeList())
                } else {
//                    print("Making new body in HTML")
//                    node.build(child: makeList())
                    node.replace(using: page)

                }
            }

        } else if let page = page as? any Operator {
            // if page is operator
//            print("doing operator: \(page)")

            // loop over children
            let (oldSize, newSize) = (node.children.count, page.children.count)
            let endRange = min(oldSize, newSize)

            for i in 0..<endRange {
                
                // TODO: reuse maybe if id's become similar
                
                // CHECK if the custom pages are the same type then reuse the old page
                if node.children[i].compareTag(to: page.children[i]) && node.children[i] is CustomNode {
                    update(node: node.children[i], with: node.children[i].page)

                } else {
                    update(node: node.children[i], with: page.children[i])

                }
                
            }

            // TODO: dont think this is possible currently because size never changes with conditional
            // TODO: When creating ol items with ids and resizable will need this and have it change
            // if old dom had more elements than new dom, delete
            if oldSize > newSize {
//                print("REMOVING EXTRA CHILD")

                for i in endRange..<oldSize {
//                    node.children[i].removeFromDOM()
                    node.children.remove(at: i)
                }

            }

            // if old dom had less elements than new dom, build
            if oldSize < newSize {
//                print("ADDING EXTRA CHILD")
                for i in endRange..<newSize {
//                    node.build(child: page.children[i])
                    _ = CustomNode.build(page: page.children[i], parent: node)
//                    node.children.append()
                }

            }

        } else {
            // if is custom page
//            print("doing custom page: \(page)")

            // uses current dom page not new one to maintain state
            update(node: node.children[0], with: node.page.body)

        }
    }
    
}
