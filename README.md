# Sailor
A web frontend framework built in swift.

**Currently only static site builds work, however adding state is planned
**Also, very early stages not all Tags, Attributes, and CSS Properties


## Usage

Sailor adopts a SwiftUI-like syntax for HTML. Below is an example view

```swift
struct ExamplePage: Page {
    var attributes: Attributes = [:]

    var body: some Page {
        Span("Hello world")
    }
}
```

Pages are root components of sailor and can be nested. All HTML elements are the base of all pages.

```swift
struct Example2Page: Page {
    var attributes: Attributes = [:]

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
        <div>
            <span>Hello World</span>
        </div>
        <span>Goodbye World</span>
    </div>
</body>
```


Sailor utilizes a resultBuilder like swiftUI for the body of tags, or if the tag takes string content then that is passed into the initializer instead.

## Attributes

Attributes are applied as a modifier after the initilizer in a SwiftUI-like manner.


```swift
struct Example3Page: Page {
    var attributes: Attributes = [:]

    var body: some Page {
        Div{
            Span("Hello world")
        }
        .attribute(.className, "hello")
    }
}
```

Attribute name is an Enum with all attributes. To add Custom attributes globally for custom components


Some components (like image) that expect tags to be utilized more readily have the attribute built into its initializer.

```swift
struct Example4Page: Page {
    var attributes: Attributes = [:]

    var body: some Page {
        Div{
            Img(src: "www.imagegoeshere.com")
        }
    }
}
```

## Custom Attributes

On custom components you can use attributes by looking at the attributes item in the page.
It is a typealias for [AttributeType: any AttributeValue].

```swift

struct InnerCustomPage: Page {
    var attributes: Attributes = [:]

    var body: some Page {
        Div{
            // if src was passed down
            if let src = attributes[.src] {
                Span(src.description)
                Img(src: src)
            } else { //if src was not passed down
                let defaultURL = "www.defaulturlimage.com"
                Span(defaultURL)
                Img(src: defaultURL)
            }
        }
    }
}

struct MyCustomPage: Page {
    var attributes: Attributes = [:]

    var body: some Page {
        Div{
            InnerCustomPage()
                .attribute(.src, "www.imagegoeshere.com")
        }
    }
}
```

If you would like to pass custom elements to a sub-Page create a custom initializer.

```swift
struct MyCustom2Page: Page {
    var attributes: Attributes = [:]

    var foo: String
    var bar: Int

    init(foo: String, bar: Int) {
        self.foo = foo
        self.bar = bar
    }

    var body: some Page {
        Div{
            Span("foo is \(self.foo)")
            Span("bar is \(self.bar)")
        }
    }
}
```

## Text

In HTML text elements (like P and Span) can have modifiers within them. "\n" and "\t" automatically convert to their HTML counterparts.

```swift
struct TextPage: Page {
    var attributes: Attributes = [:]

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

## Style

To add inline-styles to components use the .style(...) function and add styles in any order.

```swift
struct Example5Page: Page {
    var attributes: Attributes = [:]

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

** Coming soon (probably) (maybe)


Second initializer of .style that includes named paramenters. 
__pros__: more consise and readable, only allows for one of each kind of style tag to avoid overriding your own values.


__cons__: must be in a specific order when adding css parameters (this is why this might never be available).

```swift
struct Example5Page: Page {
    var attributes: Attributes = [:]

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

## State
*This section is currently being worked on...


The idea is to keep a virtual DOM in Swift and have the HTML/Javascript call Swift in WASM with state changes. Swift will update the Virtual DOM, diff, and send back the dom updates to javascript or using JavaScriptKit.


Currently implementing by not exposing the ID attribute to users and using ID to select which components to update by looping over the elements of changed state varibles that may have modified the dom.


ID probably will be calculated by going down the Page Tree and assigning a value at runtime time to avoid needing an extra bogus variable state in a Page. However must be calculated consistently to avoid updating the wrong DOM elements.

State variables will be stored globally in App and should function similarly to swiftUI.


```swift
struct ExampleStatePage: Page {
    var attributes: Attributes = [:]

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
    var attributes: Attributes = [:]

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



```swift
struct ExampleStatePage: Page {
    var attributes: Attributes = [:]

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




## EVEN MORE FUTURE


NVVM? create StateObjects like in SwiftUI


Create custom library built on the HTMLElements to be more similar to SwiftUI.


Somehow interact with swiftUI to build native iOS