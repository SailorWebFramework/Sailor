# Sailor

A web frontend framework built in swift.

![Sailor Logo](https://i.ibb.co/tZ4vRD7/DALL-E-2023-12-19-04-26-35-Revise-the-first-logo-design-for-the-Sailor-frontend-web-framework-ensuri.png)

## Overview

Web development can be tedious and lead to many issues due the many rules and weakly typed nature of it.
Many runtime-issues would be solved by a simple checks by the underlying framework. Typescript does a decent job of this, but I wanted to extend this strong typing to all aspects of web development: Tag Attributes, Styling, and Events.
I want to take the burden of the developer off of autocomplete frameworks to the compiler of a strongly typed language like swift! As well, as a mobile app developer who really enjoys the workflow of SwiftUI I wanted to make a web-framework with a SwiftUI-Like syntax.
With web-assembly theoretically code performence should be more efficient, However bundle sizes are still quite large.

## Getting Started

... TODO, sorry this is empty right now, instructions on how to start making websites with Sailor coming soon 👀


However the hack-y solution right now is create your sailor project, install swift-wasm carton, and use carton to run and bundle your website.


## Usage

Sailor adopts a SwiftUI-like syntax for HTML. Below is an example view

```swift
struct ExamplePage: Page {

    var body: some Page {
        Span("Hello world")
    }
}
```

Pages are root components of sailor and can be nested. All HTML elements are the base of all pages.

```swift
struct Example2Page: Page {

    var body: some Page {
        Div {
            ExamplePage()
            Span("Goodbye world")
        }
    }
}
```

The above code is equivalent to the following...

```html
<body>
  <div>
    <span>Hello World</span>
    <span>Goodbye World</span>
  </div>
</body>
```

Sailor utilizes a resultBuilder like swiftUI for the body of tags, or if the tag takes string content then that is passed into the initializer instead.


the Page resultBuilder also allows for conditionals


```swift
struct Example2Page: Page {
    @State var age: Int = 0

    var body: some Page {
        Div {
            ExamplePage()
            if age > 10 {
                Span("Goodbye world")
            }
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
    typealias WebRoutes = AppRoutes
    
    @Environment var environment: WebEnvironment<AppRoutes>
    
    var body: some Page {
        Router {
            Route(.Root) {
                HomePage()
            }

            Route(.about) {
                AboutPage()
            }

            Route(.explore) {
                Div("explore we go")
                Img(src: "", alt: "")
            }
        } notFound: {
            NotFoundPage()
        }
    }
}
```

## Attributes


Attributes are applied as a modifier after the initilizer in a SwiftUI-like manner. Attributes can only be applied to HTMLElements.

```swift
struct Example3Page: Page {
    var body: some Page {
        Div{
            Span("Hello world")
        }
        .classes("card", "button-component")
    }
}
```

Attribute name is an Enum with all attributes. To add Custom attributes globally for custom components. At the moment inline-style components aren't fully supported however this is currently being work on.

```swift
struct Example3Page: Page {
    var body: some Page {
        Div()
        .style(
            .backgroundColor(.rgb(200, 0, 0)),
            .display(.inlineBlock)
        )
    }
}
```

Some components (like image) that expect tags to be utilized more readily have the attribute built into its initializer.

```swift
struct Example4Page: Page {
    var body: some Page {
        Div{
            Img(src: "www.imagegoeshere.com", alt: "the is an image")
            
        }
    }
}
```

## Style (only small amount of style componenets supported right now)

To add inline-styles to components use the .style(...) function and add styles in any order.

```swift
struct Example5Page: Page {
    var body: some Page {
        Div{
            Span("Hello world")
        }
        .style(
            .backgroundColor(.rgb(255, 0, 0)),
            .width(.px(50)),
            .height(.vh(4))
        )
    }
}
```

These style are enums with associated values that take in certain units.

### Tailwind

Tailwind support is currently being created along with inline-styles...
instead of using inline style use tailwind to style components using the wind function and enums.

```swift
struct Example6Page: Page {
    var body: some Page {
        Div{
            Span("Hello world")
        }
        .wind(
            .bgBlack, .textWhite,
            .sm(.p0, .m0),
            .lg(.p10, .m10)
        )
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
        .onClick{
            print("I was clicked")
        }
        .onMouseOver{
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

Utilizes JavascriptKit and SwiftWASM to build and update the DOM on state changes.

Sailor currently uses a Virtual-DOM that is kept in memory in Swift that is checked before interacting with the DOM.

Currently implementing ID property that allows DOM elements to smartly diff more accuratly with complex additions

State variables are stored globally in App and function similarly to swiftUI.

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
        .style(
            .backgroundColor(.rgb(255, 0, 0)),
            .width(.px(50)),
            .height(.vh(4))
        )
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
        .style(
            .backgroundColor(.rgb(255, 0, 0)),
            .width(.px(50)),
            .height(.vh(4))
        )
    }
}
```

## Environment

Notice how there isnt a "head" element in our views. I wanted to abstract this away from the user in favor of environment properties.
There are 2 kinds of environment properties: persistent properties, and stacked properties. 
Persistent properties stay for the lifetime of the application while stacked properties get collapsed once a page gets destroyed.

persistent properties are things that should only have one value for the duration of the app, like favicon, ect.
these are added by their respective function in environment.


stacked properties are things like css files that can be loaded and unloaded lazily based on the screen being rendered.
These are added with the environment "add" function

TODO: this has 2 "ways" of using environment which is better? .environment or @Environement

```swift
@main
struct TestWebsite: Website {
    typealias WebRoutes = AppRoutes
    
    @Environment var environment: WebEnvironment<AppRoutes>
    
    init() {
        environment.add(
            .link(.stylesheet, "Resources/Global.css"),
            .link(.stylesheet, "Resources/Other.css")
        ) 
    }
    
    var body: some Page {
        Div("hello its me")
            .environment { env in
                env.favicon("Resources/favicon.ico")
                env.add(
                    .link(.stylesheet, "Resources/Global.css")
                )
            }
    }
}
```


## Text (COMING SOON)

TODO: not functional... this needs some work 🔨...

In HTML text elements (like P and Span) can have modifiers within them. "\n" and "\t" automatically convert to their HTML counterparts.

```swift
struct TextPage: Page {

    var body: some Page {
        Div {

            // Josh is Bolded
            P(seperator: " "){ 
                "hello"
                B("JOSH")
                "whats up?" 
            }

            P(seperator: " ") {
                "hello"
                IB("JOSH") // Bolded and Italic
                "whats up?"
            }
        }
    }
}
```

## Routing 

Routing is currently being worked on 🧰

Sailor has a strongly typed router

```swift
@Routing
struct AppRoutes: Routes {
    static var default: Self { .home }
    case home, about, explore
}
// / -> home, /about -> .about, /explore -> .explore
```

sailor also supports complex routes and query parameters

```swift
@Routing
struct AppRoutes: Routes {
    static var defaultRoute: Self { .home }
    case home, user(UserRoutes) 
}

@Routing
struct UserRoutes: Routes {
    static var defaultRoute: Self { .about }
    case about, biography, photos(limit: Int)
}
// /user or /user/about -> .user(.about), /user/biography -> .user(.biography), /user/photos/10 -> .user(.photos(limit: 10))
```

routes are called using the Route and Router component. Router defines a not found value


```swift
@main
struct TestWebsite: Website {
    typealias WebRoutes = AppRoutes
    
    @Environment var environment: WebEnvironment<AppRoutes>
    
    var body: some Page {
        Router {
            Route(.default) {
                HomePage()
            }

            Route(.about) {
                AboutPage()
            }

            Route(.explore) {
                Div("explore we go")
            }
        } notFound: {
            NotFoundPage()
        }
    }
}
```

and more??
figure out interface for relative routes "#"...


## FUTURE??

- Complex Animations?

- create StateObjects and Evironment variables like in SwiftUI

- Create custom library built on the HTMLElements to be more similar to SwiftUI.

- Use CSS Files to help with styling
- Create Build tool to easily run on IOS, Android with Ionic?
- (SUPER STRETCH) Somehow interact with swiftUI to build native iOS
