
import JavaScriptKit

extension App {

    static func forceUpdate() {
        App.document.body.innerHTML = ""
        build()
    }

    // TODO: update the view if the DOM changed
    static func update(state: Int, newValue: Any) {
        guard let root = self.root else { return }
        guard let rootDomNode = self.virtualDOM.children.first else { return }

        // update the state
        Self.states[state] = newValue
        
        // TODO: Remove and diff , dont delete everything
        // App.forceUpdate()

        diff(page: root, domNode: rootDomNode)
        
        print("PRINTING TREE")
        self.virtualDOM.printTree()

    }

    static func diff(page: any Page, domNode: DOMNode) {
        // hide list while diffing, go into its children
        // if let page = page as? List {
        //     for child in page.children {
        //         diff(page: child, domNode: domNode)   
        //     }
        //     return
        // }

        // somehow this may update page so stored value?
        let comparison = domNode.compareOuter(to: page) // domNode.compare(to: page)

        // debug prints, remove these prints eventually 
        print(type(of: page), type(of: domNode.page), "||", comparison, "|| a: ", domNode.attributes, "->", page.attributes)
        if let dompage = domNode.page as? any HTMLElement,
           let page = page as? any HTMLElement {
            print("content: ", dompage.content, page.content)
        }

        // check comparison
        if !comparison {
            // replace element if it is not the same
            domNode.replace(page)
            print("REPLACING ^ above:")
        } 

        // TODO: Deal with deletions and additions not just modifications
        if let page = page as? any HTMLElement {
            self.match(to: page, parentNode: domNode)
        } else {    
            // TODO: maybe replace with .first cuz should only be one child in a custom page
            for child in domNode.children {
                diff(page: page.body, domNode: child)
            }
        }

    }

    // adds List to queue and returns the amount added
    private static func addListToQueue(queue: inout [any Page], _ list: List) -> Int {        
        
        var total = 0
        for child in list.children {
            if let child = child as? List {
                total += addListToQueue(queue: &queue, child)
                continue
            }

            queue.append(child)
            total += 1
        }

        return total
    }

    // TODO: match the the children in page to the children in parentNode
    private static func match(to page: any HTMLElement, parentNode: DOMNode) {
        // TODO: assert these must be equal
        if page.children.count == 0 && parentNode.children.count == 0 {
            return
        } else if page.children.count == 0 || parentNode.children.count == 0 {
            print("ISSUE WITHIN MATCH CHILDREN NOT SYNCED")
            return
        }


        // TODO: Make this work with lists, if empty skip however they are still in the array so .count will be wrong
        // also if not empty must elaborate while doing the match

        // maybe create a queue and a map tree while doing the match
        var pageQueue: [any Page] = []
        var domNodeQueue: [DOMNode] = []
        var (pindex, dnindex) = (0, 0)

        // collapse lists and add pages to queues for optimization
        while pindex < page.children.count || dnindex < parentNode.children.count {
            if pindex < page.children.count {
                // if let list = page.children[pindex] as? List { 
                //     _ = Self.addListToQueue(queue: &pageQueue, list)
                // } else {
                //     pageQueue.append(page.children[pindex])
                // }

                pageQueue.append(page.children[pindex])
                pindex += 1

            }

            if dnindex < parentNode.children.count { 
                domNodeQueue.append(parentNode.children[dnindex])
                dnindex += 1
            }

        }

        print("page \(type(of: page)), and size \(pageQueue.count), psize: \(domNodeQueue.count)")

        for i in 0..<min(pageQueue.count, domNodeQueue.count) {
            diff(page: pageQueue[i], domNode: domNodeQueue[i])
        } 
        
        // add extra elements
        if pageQueue.count > domNodeQueue.count {
            print("BUILDING MORE ELEMENTS")
            for i in domNodeQueue.count..<pageQueue.count {
                pageQueue[i].build(parentNode: parentNode)   
            }
        }

        // remove extra elements
        if pageQueue.count < domNodeQueue.count {
            print("REMOVING ELEMENTS")
            for i in pageQueue.count..<domNodeQueue.count {
                domNodeQueue[i].remove()
            }
        }
    }

}