# Sailboat

A virtual dom implementation built for Swift


## What is Sailboat

Sailboat is built for Sailor Frontend Web Framework, however this implementation can be used as a virtual dom with SwiftUI-like syntax for any Swift application.
This library is used by Sailor to keep an instance of the DOM in memory to correctly reconcile in the browser.


## Components

The dom tree is composed of 3 different kinds of elements Custom Pages, Operator Nodes, and element Nodes.


### Page

Any component in the virtual dom conforms to the page protocol. This is used by the user to create custom pages.
Operators and Elements both implement Page

### Operator

Operator nodes contain a collection of Nodes and contain meta-data attached to the elements for rendering.
Custom Operator nodes can be created with specific rendering constraints (example: a Sailor Route is an operator node).

### Element

Element nodes are leaves of the DOM tree.


## How it works

Sailboats Component model works a bit different then SwiftUI and adjacent libraries and does not have any maximum amount of PageBuilder elements.
This is due to Sailboats Component model. There are three main parts Custom Pages, Elements, and Operators. 

### Custom Pages

Custom Pages contain one property, a body which is a resultBuilder(ie: PageBuilder) that must contain other Pages, Elements, and Operators inside defined as follows.


```swift
// example below is using Sailor Web Framework
struct SailboatPage: Page {    
    var body: some Page {
        Div {
            Div("hello world")
            Div("this is me")
        }
    }
}
```


### Elements

(Subject to change, String may turn into a renderable element in Page Builder not needing the value option of element 🚧)

Elements contain either a value or an Operator. Elements are always the leaf nodes of the virtual DOM.
Elements also include attributes and events that can be used when rendering the Element outside of the DOM

```swift
public protocol Element: Page {
    associatedtype ElementAttributeGroup: AttributeGroup

    /// HTML tag name, all lowercased
    var name: String { get }
    
    /// attributes on element
    var attributes: [String: String] { get set }
    
    /// event names and values attached to this HTMLElement
    var events: Events { get set }
    
    /// TagContent is an enum with associated values either a String or an Operator 
    var content: TagContent { get set }
}
```

In Sailor these elements are used as HTMLElements and contain either a List operator of children or string value.


### Operators

Operators contain a list of children and define certain render characteristics. 
This component is not visually rendered but defines how the children it contains should be rendered.

Built in Operator nodes
- List -> Defines a list of children
- Conditional -> Defines a conditional with children (if statement)


Sailor Extended Operator Nodes
- Route -> Defines a Route that is conditionally rendered depending on status


### PageBuilder

The Page Builder is a simple result builder that wraps children in a list or a conditional based on its contents.
This is how the body of a page is rendered , it always returns any Operator node.

```swift
@resultBuilder
public struct PageBuilder {
    public static func buildBlock(_ children: any Page...) -> any Operator {
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
```


## Target Manager

The target manager is stored globally in SailboatGlobal, it includes the virtual DOM body along with the environment.
It also contains the two functions needed for diffing, build(...) and update(...). 

Here is the protocol definition (subject to change with introduction of signals)

```swift
public protocol TargetManager {
    var environment: (any SomeEnvironment)? { get set }
    var body: PageNode? { get set }

    func build<GenericPage: Page>(page: GenericPage)
    func update()
}
```


## Stateful-Design

These property wrappers are how Sailboat manages state. 
At the end of an Event these property wrappers tell Sailboat to update the VirtualDOM

### State & Binding

State and Binding Variables are marked witht the @State and @Binding property.


### Environment

Environment is designed to be extensible by the reconceliation libarary by conforming to SomeEnvironment, and include any enviroment properties desired by the wrapped framework.
These properties can be called by the @Environment using a KeyPath of the entire object.

EnvironmentObjects are also expected to work much like swiftUI using the @EnvironmentObject Property Wrapper


## PageNodes

A page node is a reference type that holds the current instance of a rendered page as a tree structure.
These are used when Diffing and a pointer to the head is located in SailboatGlobal.manager body element


## Macros

In the future sailboat hopes to support a series of macros. 

These macros include... 
marking a page as @StatelessPage that enforces stateless elements and ensures the component is never rerendered.

Creating StateObjects much like swiftUI and combine

## Diffing

This is my designed Diffing algorithm, inspired by other web frameworks and trail and error.
Currently not all parts are implemented but going to be.

### Basic Overview

Virtual DOM nodes of each "Component" are stored in memory (the heap), once a state variable or environment variable changes it triggers a rerender.
Any components that change based off the new state values get replaced in the DOM tree.

### Batched Updates

When an update event starts it modifies all the States until the update event is concluded.

For example in Sailor...

```swift
struct BatchedUpdatePage: Page {
    @State var age: Int = 0
    @State var name: String = "Josh"
    
    var body: some Page {
        Div{
            Span("\(name): \(age)")
        }
        .onClick {
            age += 1
            name += "!" 
        }
    }
}
```

Once age gets incremented instead of immediatly updating the DOM sailboat should wait until the full update event of OnClick is concluded to update the DOM.
In this example it is incrementing the age and changing the name


### Signals

Instead of updating the entire DOM or an entire custom page hirarchy that relies on a state. 
Sailboat should only update elements that include the actual state with @State or binded state with @Binding.

This is achieved by caching which states values map to each custom page

```
[
    CustomPage1: [1, 2, 3] // relies on states 1, 2, and 3
    CustomPage2: [3, 4, 5] // relies on states 3, 4, and 5
]

```

In the example above, theres no need to update CustomPage2 if only states 1 and 2 are modified, 
saving computation. Only when state 3 is modified do both pages need to be updated.
With many more custom pages and states the efficiency can be seen much more


This is achived on build by globally registering states when the DOM tree is created & modified.

```
Building Page 0 -> Contains states 0, 1 -> add to map
Building Page 1 -> Contains states 1, 2 -> add to map
Building Page 3 -> Contains states 3 -> add to map
Building Page 4 -> Contains no states 
Building Page 5 -> Contains states 4, 5, 6, 7 -> add to map
ect.
```

Upon re-rendering a page it will rerender all elements except Custom Pages if the states do not intersect.
Due to the way swift handles strings composition it is difficult to get any more granular updating.

### Update Priorities

Some jobs should have more priority in an update than others .

(Under Construction 🚧)


### Reconceliation Injection

Sailboat should allow the reconciler to be able to function without having to loop over the entire DOM twice.
This should be achived through Injecting pointers to the DOM and update methods to only update functions neccisary.

(Under Construction 🚧)

## Extendible Design

Sailboat is lightweight and designed to be able to be used in a variety of codebases.
Sailboat does not include any Elements which can be created by the user to create a reactive framework.

