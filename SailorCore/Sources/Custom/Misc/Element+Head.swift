//
//  Element+Head.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat


// TODO: consider removing however it resturns Self rather than in Page any Element which allows it to be a top-level page
public extension Element {
    func head(@HeadBuilder _ builder: @escaping () -> any Fragment) -> Self {
        let built = builder()

        // TODO: dont care about state changes right now, but make it so if statements work
        _ = SailboatGlobal.manager.dump()
        
        // TODO: allow for custom nodes in head? create HeadElement protocol
        return self.onAppear {
            RenderableUtils.build(
                page: built,
                parent: SailorGlobal.headRef
            )
        }.onDisappear {
            // TODO: make a RenderableUtil for remove
            // remove items from head
            for element in built.children {
                guard let element = element as? any Element else { continue }
                
                element.renderer.remove()
            }
        }
    }
}

public extension Page  {
    func head(@HeadBuilder _ builder: @escaping () -> any Fragment) -> any Element {
        let built = builder()
        
        // TODO: dont care about state changes right now, but make it so if statements work
        _ = SailboatGlobal.manager.dump()
        
        // TODO: allow for custom nodes in head? create HeadElement protocol
        return self.onAppear {
            RenderableUtils.build(
                page: built,
                parent: SailorGlobal.headRef
            )
        }.onDisappear {
            // TODO: make a RenderableUtil for remove
            // remove items from head
            for element in built.children {
                guard let element = element as? any Element else { continue }
                
                element.renderer.remove()
            }
        }
    }
}
