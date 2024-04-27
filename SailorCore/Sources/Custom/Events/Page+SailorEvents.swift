//
//  Page+ExtraEvents.swift
//  
//
//  Created by Joshua Davis on 2/27/24.
//

import Sailboat

public extension Element {
    
    func onAppear(_ completion: @escaping () -> Void) -> Self {
        withEvent(name: "_appear") { _ in // _appear
            completion()
        }
    }

    func onDisappear(_ completion: @escaping () -> Void) -> Self {
        withEvent(name: "_disappear") { _ in // _disappear
            completion()
        }
    }

    func onUpdate(_ completion: @escaping () -> Void) -> Self {
        withEvent(name: "_update") { _ in
            completion()
        }
    }
    
    func task(_ completion: @escaping  () async -> Void) -> Self {
        withEvent(name: "_task") { _ in
            Task {
                // TODO: create an async queue that doesnt block other renders
                SailboatGlobal.manager.startEvent()
                await completion()
                SailboatGlobal.manager.endEvent()
            }
        }
    }

    func environmentObject(_ object: any ObservableObject) -> Self {
        // TODO: object.id?
        let typeID = String(describing: type(of: object))

        if SailboatGlobal.manager.objects[typeID] == nil {
            SailboatGlobal.manager.objects[typeID] = object
        }

        return withEvent(name: "_killEnvironmentObject") { _ in
            let typeID = String(describing: type(of: object))
            SailboatGlobal.manager.objects[typeID] = nil
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
    
    
    func environmentObject(_ object: any ObservableObject) -> any Element {
        traversePage(self) {
            $0.environmentObject(object)
        }
    }
    
    internal func traversePage(_ page: any Page, completion: (any Element) -> any Element) -> any Element {
        if let page = page as? any Element {
            return completion(page)
        }
        
        // TODO: because of router what should the expected outcome be?
        if let page = page as? any Fragment {
            
            if let firstChild = page.children.first {
                return traversePage(firstChild, completion: completion)
            }
            fatalError("Operator should never have an empty root before Element")
        }
        
        return traversePage(page.body, completion: completion)
    }
}
