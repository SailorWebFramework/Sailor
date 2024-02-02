//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

// TODO: Think on this for Optional conditionals places a blank div in vmem
@resultBuilder
public struct PageBuilder {
    public static func buildBlock(_ children: any Page...) -> any Operator {
        //TODO: do I need this? maybe test and see if diff is easier
        
//        if children.count == 1,
//           let list = children.first as? any Operator
//        {
//            return list
//        }

        return List(children)
    }
    
    public static func buildOptional(_ component: (any Operator)?) -> any Operator {
        guard let component = component else { return Conditional([]) } // or? Conditional([Div()])

        return checkCountWrapDivForConditional(component: component)
    }
    
    public static func buildEither(first component: any Operator) -> any Operator {
        return checkCountWrapDivForConditional(component: component)
    }

    public static func buildEither(second component: any Operator) -> any Operator {
        return checkCountWrapDivForConditional(component: component)
    }
    
    private static func checkCountWrapDivForConditional(component: any Operator) -> any Operator {
        return Conditional(component.children)

//        if component.children.count == 1,
//           component.children.first is any Operator
//        {
//            return Conditional([component.children.first!])
//        }
//
//        // TODO: make this work without implicit Div, error in reconcile or JSNode
//        return Conditional([ component ])
        
//        return Conditional([Div { component }])
    }
    
}
