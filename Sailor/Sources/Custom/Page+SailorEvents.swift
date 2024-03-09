//
//  Page+ExtraEvents.swift
//  
//
//  Created by Joshua Davis on 2/27/24.
//

import Sailboat

public extension Element {
    
    func onAppear(_ completion: @escaping () -> Void) -> Self {
        withEvent(name: "_appear") { _ in
            // TODO: problem is when we chain clicks together doesnt work
            SailboatGlobal.manager.startEvent()
            completion()
            SailboatGlobal.manager.endEvent()
        }
    }

    func onDisappear(_ completion: @escaping () -> Void) -> Self {
        withEvent(name: "_disappear") { _ in
            // problem is when we chain clicks together doesnt work
            SailboatGlobal.manager.startEvent()
            completion()
            SailboatGlobal.manager.endEvent()
        }
    }

    func onUpdate(_ completion: @escaping () -> Void) -> Self {
        withEvent(name: "_update") { _ in
            // problem is when we chain clicks together doesnt work
            SailboatGlobal.manager.startEvent()
            completion()
            SailboatGlobal.manager.endEvent()
        }
    }
    
    func task(_ completion: @escaping () -> Void) -> Self {
        withEvent(name: "_task") { _ in
            // problem is when we chain clicks together doesnt work
            SailboatGlobal.manager.startEvent()
            completion()
            SailboatGlobal.manager.endEvent()
        }
    }
}

public extension Page {
    
    func onAppear(_ completion: @escaping () -> Void) -> any Element {
        traversePage(self) {
            $0.onAppear {
                completion()
            }
        }
    }

    func onDisappear(_ completion: @escaping () -> Void) -> any Element {
        traversePage(self) {
            $0.onDisappear {
                completion()
            }
        }
    }

    func onUpdate(_ completion: @escaping () -> Void) -> any Element {
        traversePage(self) {
            $0.onUpdate {
                completion()
            }
        }
    }
    
    func task(_ completion: @escaping () -> Void) -> any Element {
        traversePage(self) {
            $0.task {
                completion()
            }
        }
    }
    
    private func traversePage(_ page: any Page, completion: (any Element) -> any Element) -> any Element {
        if let page = page as? any Element {
            return completion(page)
        }
        
        // TODO: because of router what should the expected outcome be?
        if let page = page as? any Operator,
           let firstChild = page.children.first
        {
//            fatalError("Operator should never come before Element")
            return traversePage(firstChild, completion: completion)
        }
        
        return traversePage(page.body, completion: completion)
    }
}
