# Sailor

A web frontend framework built in swift.

![Sailor Logo](https://i.ibb.co/tZ4vRD7/DALL-E-2023-12-19-04-26-35-Revise-the-first-logo-design-for-the-Sailor-frontend-web-framework-ensuri.png)

## Overview

Web development can be tedious and lead to many issues due the many rules and weakly typed nature of it.
Many runtime-issues would be solved by a simple checks by the underlying framework. Typescript does a decent job of this, but I wanted to extend this strong typing to all aspects of web development: Tag Attributes, Styling, and Events.
I want to take the burden of the developer off of autocomplete frameworks to the compiler of a strongly typed language like swift! As well, as a mobile app developer who really enjoys the workflow of SwiftUI I wanted to make a web-framework with a SwiftUI-Like syntax.
With web-assembly theoretically code performence should be more efficient, However bundle sizes are still quite large.

## Getting Started

... instructions on how to start making websites with Sailor Compass CLI coming soon 👀


For now you can start creating a Sailor project by including the framework in your Swift Package

```swift
    .package(url:"https://github.com/SailorFrontendFramework", from: "0.2")
```

to run your project Sailor uses Carton

```bash
swift run carton dev # runs the dev environment
swift run carton bundle # bundles the code
```

## Usage

Sailor adopts a SwiftUI-like syntax for HTML. Below is an example view

```swift
struct ExamplePage: Page {

    var body: some Page {
        HTML.Div {
            HTML.Span("Hello world")
        }
    }
}
```

Pages are root components of sailor and can be nested. All HTML elements are the base of all pages.

```swift
struct Example2Page: Page {

    var body: some Page {
        HTML.Div {
            ExamplePage()
            HTML.Span("Goodbye world")
        }
    }
}
```

The above code is equivalent to the following...

```html
<body>
  <div>
    <div>
        <span>Hello World</span>
    </div>
    <span>Goodbye World</span>
  </div>
</body>
```

Sailor utilizes a resultBuilder like swiftUI for the body of tags, or if the tag takes string content then that is passed into the initializer instead.


the Page resultBuilder also allows for conditionals and loops


```swift
struct Example2Page: Page {
    @State var age: Int = 0
    
    var names: [String] = ["Josh", "Tim", "Jeff", "John"]

    var body: some Page {
        HTML.Div {
            if age > 10 {
                HTML.Span("Goodbye world")
            }
            
            HTML.Div {
                for name in names {
                    HTML.Span(name)
                }
            }
        }
    }
}
```

By default for loops only update their body on the change of size of the sequence. However if you want to provide a key to update the body elements on when its value changes use the .key(...) attribute


```swift
struct Example2Page: Page {    
    var names: [String] = ["Josh", "Tim", "Jeff", "John"]

    var body: some Page {
        HTML.Div {
            HTML.Div {
                for name in names {
                    HTML.Span(name)
                        .key(name)
                }
            }
        }
    }
}
```

By default all tags are located in the HTML enum, and sailor supports nearly all HTML tags and attributes. This is an on-going effort and all tags are expected to be supported eventually.
Not having tags in the base scope by default was done to be extra explicit what kind of tag you are using and not to clutter the main scope.
If you want to add tags to the local scope its recommended to add specific tags to the scope via a typealias.

```swift
typealias Div = HTML.Div
typealias Span = HTML.Span
typealias H1 = HTML.H1
...
```


When creating a component library its recommended to put them within an enum and let the user decide which components they need in their main scope. It also allows extra explicitness to reduce coding errors.


```swift
public enum CustomTagLib {
    // Custom tags defined here
}
```

```swift
struct CustomExamplePage: Page {    
    var body: some Page {
        HTML.Div {
            // This clearly shows whether you are using a custom button or html button
            CustomTagLib.Button("Hi im a button")
            HTML.Button("Hi im a button")
        }
    }
}
```


## EntryPoint

The main entry point for sailor is the Website protocol. 
The body defines the page to be rendered as follows.

```swift
@main
struct TestWebsite: Website {

    var head: some WebHead {
        HTML.Head {
            HTML.Title("Test Website")
        }
    }
    
    var body: some WebBody {
        HTML.Body {
            HomePage()
        }
    }
}
```

## Attributes

Attributes are applied as a modifier after the initilizer in a SwiftUI-like manner. Attributes can only be applied to Elements. Certain elements have specific attributes like HTML.


```swift
struct Example4Page: Page {
    @State var value: Double = 0
    var body: some Page {
        Div{
            HTML.Progress { }
                .value(value)
                .max(100)
        }
    }
}
```

Some components (like image) that expect attributes to be utilized more readily have the attribute built into its initializer.

```swift
struct Example4Page: Page {
    var body: some Page {
        HTML.Div {
            HTML.Img(src: "www.imagegoeshere.com", alt: "the is an image")
        }
    }
}
```


## Classes


Classes have a special result builder function in an Element that allows you easily add and save packs of classes in one. The value inputted is String or DynamicClass.

```swift
struct ClassesExample1Page: Page {
    var body: some Page {
        Div{
            Span("Hello world")
        }
        .classes{ 
            "card" 
            "button-component"
        }
    }
}
```


Just like page builder it supports conditionals and custom dynamic classes


```swift
struct ContainerLarge: DynamicClass {
    @Binding var toggle: Bool

    var classes: some DynamicClass {
        ClassGroup {
            if toggle {
                "big-container-blue"
            } else {
                "big-container-red"
            }
        }
    }
}
```

```swift
struct ClassesExample2Page: Page {
    @State var toggle: Bool = true
    
    var classNames: [String] = ["red-box", "large-card"]
    var body: some Page {
        Div{
            Span("Hello world")
        }
        .classes { 
            if toggle {
                "card" 
            }
            
            for name in classNames {
                name
            }
            
            ContainerLarge(toggle: $toggle)
        }
    }
}
```


It's recommended that for custom-class libraries and in your own codebase to use enums to keep class names to ensure no typing-issues 

```swift
enum Classes: String {
    case containerBig = "container-big"
    case containerSmall = "container-small"
}
```

```swift
struct ClassesExample3Page: Page {    
    var body: some Page {
        Div{
            Span("Hello world")
        }
        .classes { 
            Classes.containerBig // users custom classe
            TW.sm(.m0, .p0) // example for tailwind 
        }
    }
}
```

## Style

similar to the .classes result builder to add inline-styles to components use the .style{...} result builder and add styles in any order.
All CSS styles are available under the CSS enum. 

```swift
struct Example5Page: Page {
    @State var toggle: Bool = true
    
    var body: some Page {
        Div{
            Span("Hello world")
        }
        .style {
            CSS.backgroundColor(.rgb(255, 0, 0))
            CSS.width(.px(50))
            CSS.height(.vh(4))
            ContainerLarge(toggle: $toggle)
        }
    }
}
```


All CSS properties are expected to be accessable in the future but it is an on-going effort. String style properties are also accessible.
CSS styles are enums with associated values that take in certain units. The goal is to make a strongly typed CSS interface to more easily catch errors.


Like dynamic classes it is also possible to create cutom style properties that can contain state.

```swift
struct ContainerLarge: Style {
    @Binding var toggle: Bool

    var style: some Style {
        StyleGroup {
            CSS.backgroundColor(.aqua)
            CustomCardStyle(toggle: $toggle)
        }
    }
}
```


## Units

Units are used by style and attributes to hold values.

**examples:**
**Dimention** -> used for any unit of length in styles
**Color** -> used for any unit of color (rgb, hsl, ...)
... There are more not listed here

## Events

Events are added like modifiers to tags and many events can be chained.


```swift
struct Example7Page: Page {
    var body: some Page {
        Button("Hello World")
        .onClick {
            print("I was clicked")
        }
        .onMouseOver {
            print("I was hovered")
        }
    }
}
```


Some events return values within the closures for example the onKeyDown Event

```swift
struct Example5Page: Page {
    var body: some Page {
        Button("Hello World")
        .onKeyDown { key in
            print("\(key) was clicked")
        }
    }
}
```


## State

By using @State and @Binding you can create and store and send state values between properties. 
Later Swift-UI-like versions @StateObject, @EnvironmentObject, and @ObservedObject will be supported.

```swift
struct ExampleStatePage: Page {
    // creates a new global state
    @State var foo = 0

    var body: some Page {
        Div{
            Span("Hello \(foo)")
                .onClick {
                    // triggers a rerender
                    foo += 1
                }
        }
        .style {
            CSS.backgroundColor(.rgb(255, 0, 0))
            CSS.width(.px(50))
            CSS.height(.vh(4))
        }
    }
}
```

```swift
struct ExampleStatePage: Page {
    //passed in by parent component, maps to same global state
    @Binding var foo: Int

    var body: some Page {
        Div{
            Span("Hello \(foo)")
                .onClick {
                    foo += 1
                }
        }
        .style {
            CSS.backgroundColor(.rgb(255, 0, 0))
            CSS.width(.px(50))
            CSS.height(.vh(4))
        }
    }
}
```

## Algorithm

Sailor uses a signals-like approach to state management and efficiently updates the DOM attributes independently of a full page update depending on which states change.

Sailor maintains a dependency graph of states to page elements and can efficiently update the DOM.


## Environment


Environment properties give contextual information about the web page. For example get the url.
More environment properties will be added in the future.

```swift
@main
struct EnironmentTextPage: Page {
    @Environment var environment: WebEnvironment

    var body: some Page {
        HTML.Div {
            HTML.H1("url: \(environment.url)")
        }
    }
}
```


## Head


Head items that need to stay the duration of the app can be applied in the main Website struct like below.

```swift
@main
struct TestWebsite: Website {
    
    var head: some WebHead {
        HTML.Head {
            HTML.Title("My Title")
            HTML.Link(rel: "icon", href: "favicon.ico")
            HTML.Link(rel: "stylesheet", href: "PackageName_TargetName.resources/MainStyles.css")
        }
    }
    
    var body: some WebBody {
        HTML.Body {
            HTML.H1("Title")
        }
    }
}
```


Head elements can be added throughout the rest of the app through the .head {...} function.


```swift
@main
struct OtherPage: Page {

    var body: some Page {
        HTML.Div {
            HTML.H1("Title")
        }
        .head {
            HTML.Link(rel: "stylesheet", href: "PackageName_TargetName.resources/OtherPage.css")
        }
    }
}
```


## Text 


Certain Elements have text based initializers that allow you pass in Text to the constructor. Also the PageBuilder can take in Strings.

```swift
struct TextPage: Page {
    @State var name: String = "Josh"

    var body: some Page {
        Div {
            P { 
                "hello "
                B(\(name))
                " whats up?" 
            }
        }
    }
}
```

## Crates (Future)


In the future a system to install custom customizable components to your codebase. This will be able to be done through the Compass CLI.
Check the Compass repo for new updates.


## Fleet (Future)


In the future, packages like Tailwind and Navigtor will be packages availble for projects.
Fleet packages will be able to run certain tasks when running and bundling your code. 
For example launching a tailwind server when running the dev server. 
Check the Compass repo for new updates.


## Known Issues and Future Features


Found issue where some events dont trigger when stacked in certain ways

In the future asyncronous DOM updates and asyncronous firing of code will be supported

All CSS elements should be supported

Certain updates fail to happen (will be fixed)
