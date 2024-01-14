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
            node.replace(using: page)
            return
        }

        if let page = page as? any HTMLElement {
            // if page is html element
            
            node.update(using: page)

            switch page.content {
            case .text(_):
                node.children = []
            case .list(let makeList):
                let operatorNode = makeList()

                // loop over children on current node
                if let first = node.children.first {
                    update(node: node.children.first!, with: operatorNode)
                } else {
                    node.replace(using: page)
                }
                
            }

        } else if let page = page as? any Operator {
            // if page is operator
            let (oldSize, newSize) = (node.children.count, page.children.count)
            let endRange = min(oldSize, newSize)

            // loop over children
            for i in 0..<endRange {
                // TODO: reuse maybe if id's become similar
                    update(node: node.children[i], with: page.children[i])
            }

            // if old dom had more elements than new dom, delete
            for i in (endRange..<oldSize).reversed() {
                node.children.remove(at: i)
            }

            // if old dom had less elements than new dom, build
            for i in endRange..<newSize {
                _ = CustomNode.build(page: page.children[i], parent: node)
            }

        } else {
            // if is custom page uses current dom page not new one to maintain state
            update(node: node.children[0], with: node.page.body)
        }
    }
}
