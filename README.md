# Sailor
A web frontend framework built in swift.


![Sailor Logo](https://i.ibb.co/tZ4vRD7/DALL-E-2023-12-19-04-26-35-Revise-the-first-logo-design-for-the-Sailor-frontend-web-framework-ensuri.png)

## Getting Started

... TODO, sorry this is empty right now, instructions on how to start making websites with Sailor coming soon 👀


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


## Attributes (only small amount of attributes componenets supported right now)

Attributes are applied as a modifier after the initilizer in a SwiftUI-like manner. Attributes can only be applied to HTMLElements.


```swift
struct Example3Page: Page {
    var body: some Page {
        Div{
            Span("Hello world")
        }
        .attribute(.className, "hello")
    }
}
```

Attribute name is an Enum with all attributes. To add Custom attributes globally for custom components


Because style attribute is so common it has its own function on all HTMLElements and can be added below, however can still be used in the .attribute(...) function.


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
            Img(src: "www.imagegoeshere.com")
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

Second initializer of .style that includes named paramenters. 
__pros__: more consise and readable, only allows for one of each kind of style tag to avoid overriding your own values.


__cons__: must be in a specific order when adding css parameters (this is why this might never be available).

```swift
struct Example5Page: Page {
    var body: some Page {
        Div{
            Span("Hello world")
        }
        .style(
            backgroundColor: .rgb(255, 0, 0),
            width: .px(50),
            height: .vh(4)
        )
    }
}
```


These style are enums with associated values that take in certain units.

### Units

__currently supported__
**Dimention** -> used for any unit of length in styles
**Color** -> used for any unit of color (rgb, hsl, ...)


## Events

** Events will be created with state


will be meathod on a page

...onClick, onHover, ..., and so on


## Text (COMING SOON)

In HTML text elements (like P and Span) can have modifiers within them. "\n" and "\t" automatically convert to their HTML counterparts.

```swift
struct TextPage: Page {
    var foo: String
    var bar: Int

    init(foo: String, bar: Int) {
        self.foo = foo
        self.bar = bar
    }

    var body: some Page {
        Div {
            
            // Josh is Bolded
            P{ "hello ";B("JOSH");" whats up?" }
            
            P(seperator: " ") {
                "hello"
                I{B("JOSH")} // Bolded and Italic
                "whats up?"
            }

        }
    }
}
```


## State (Mostly working, a bit buggy)

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


## Events

Events are Sailor's version of event listners on DOM properties. for example "onClick", "onMouseOver", ...

These can be attached to any HTMLElement. The DOM only rerenders once the @State or @Binding values change

```swift
...
    Div{
        Span("Hello \(foo)")
            .onClick {
                foo += 1
            }
    }
...
```


```swift
struct ExampleStatePage: Page {
    // passed in by application, accessable in any componenet, in global state
    @Environment var foo: Int

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



## Routing (Not Implementing)

The idea is to use Swift attached Macros to add routes to Pages

## FUTURE??

- Complex Animations?

- create StateObjects and Evironment variables like in SwiftUI

- Create custom library built on the HTMLElements to be more similar to SwiftUI.

- Use CSS Files to help with styling
  
- Create Build tool to easily run on IOS, Android with Ionic?
  
- (SUPER STRETCH) Somehow interact with swiftUI to build native iOS
