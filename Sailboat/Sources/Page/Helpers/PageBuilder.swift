//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

@resultBuilder
public struct PageBuilder {
    public static func buildBlock(_ children: any Page...) -> any Operator {
        //TODO: do I need this? maybe test and see if diff is easier
        //TODO: debug maybe i dont think this should be possible.. maybe with routing implemented
//        if children.count == 1,
//           let list = children.first as? any Operator
//        {
//            return list
//        }

        return List(children)
    }
    
    public static func buildOptional(_ component: (any Operator)?) -> any Operator {
        guard let component = component else { return Conditional([]) } // or? Conditional([Div()])

        return Conditional(component.children)
    }
    
    public static func buildEither(first component: any Operator) -> any Operator {
        return Conditional(component.children)
    }

    public static func buildEither(second component: any Operator) -> any Operator {
        return Conditional(component.children)
    }
    
}
