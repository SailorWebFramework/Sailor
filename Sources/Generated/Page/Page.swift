// This file was autogenerated by Mustache. DO NOT CHANGE.
//
//  Page.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import JavaScriptKit

// TODO: consider renaming to View to be more similar to swiftUI?
public protocol Page: Hashable, Equatable, CustomStringConvertible {
    associatedtype Body: Page

    var body: Body { get }
    // TODO: remove attributes and only have in HTMLElement
    var attributes: Attributes { get set }
    
    func build(parent: JSValue, virtualDOM: DOMNode)
    func outerEquals(to page: any Page) -> Bool 
    //func innerEquals(to page: any Page)

    // Events
    func onClick(_ completion: @escaping () -> Void) -> any Page
    func onKeyDown(_ completion: @escaping (String) -> Void) -> any Page
    func onMouseOver(_ completion: @escaping () -> Void) -> any Page
    func onMouseOut(_ completion: @escaping () -> Void) -> any Page
    func onChange(_ completion: @escaping (String) -> Void) -> any Page
    func onSubmit(_ completion: @escaping () -> Void) -> any Page
    func onKeyPress(_ completion: @escaping (String) -> Void) -> any Page
    func onKeyUp(_ completion: @escaping (String) -> Void) -> any Page
    func onFocus(_ completion: @escaping () -> Void) -> any Page
    func onBlur(_ completion: @escaping () -> Void) -> any Page
    func onDoubleClick(_ completion: @escaping () -> Void) -> any Page
    func onScroll(_ completion: @escaping () -> Void) -> any Page
    func onTouchStart(_ completion: @escaping (JSObject) -> Void) -> any Page
    func onTouchEnd(_ completion: @escaping (JSObject) -> Void) -> any Page
    func onTouchMove(_ completion: @escaping (JSObject) -> Void) -> any Page
    func onDragStart(_ completion: @escaping (JSObject) -> Void) -> any Page
    func onDragOver(_ completion: @escaping (JSObject) -> Void) -> any Page
    func onDrop(_ completion: @escaping (JSObject) -> Void) -> any Page

}

//MARK- Events
extension Page {

    // old: App.console(error: EventError.eventNotModifiedForCustomComponent(self, "on"))
    // now: Wraps in div by default for custom pages
    public func onClick(_ completion: @escaping () -> Void) -> any Page {
        Div { 
            self 
        }.onClick { 
            completion()
        }
    }
    public func onKeyDown(_ completion: @escaping (String) -> Void) -> any Page {
        Div { 
            self 
        }.onKeyDown { value in
            completion(value)
        }
    }
    public func onMouseOver(_ completion: @escaping () -> Void) -> any Page {
        Div { 
            self 
        }.onMouseOver { 
            completion()
        }
    }
    public func onMouseOut(_ completion: @escaping () -> Void) -> any Page {
        Div { 
            self 
        }.onMouseOut { 
            completion()
        }
    }
    public func onChange(_ completion: @escaping (String) -> Void) -> any Page {
        Div { 
            self 
        }.onChange { value in
            completion(value)
        }
    }
    public func onSubmit(_ completion: @escaping () -> Void) -> any Page {
        Div { 
            self 
        }.onSubmit { 
            completion()
        }
    }
    public func onKeyPress(_ completion: @escaping (String) -> Void) -> any Page {
        Div { 
            self 
        }.onKeyPress { value in
            completion(value)
        }
    }
    public func onKeyUp(_ completion: @escaping (String) -> Void) -> any Page {
        Div { 
            self 
        }.onKeyUp { value in
            completion(value)
        }
    }
    public func onFocus(_ completion: @escaping () -> Void) -> any Page {
        Div { 
            self 
        }.onFocus { 
            completion()
        }
    }
    public func onBlur(_ completion: @escaping () -> Void) -> any Page {
        Div { 
            self 
        }.onBlur { 
            completion()
        }
    }
    public func onDoubleClick(_ completion: @escaping () -> Void) -> any Page {
        Div { 
            self 
        }.onDoubleClick { 
            completion()
        }
    }
    public func onScroll(_ completion: @escaping () -> Void) -> any Page {
        Div { 
            self 
        }.onScroll { 
            completion()
        }
    }
    public func onTouchStart(_ completion: @escaping (JSObject) -> Void) -> any Page {
        Div { 
            self 
        }.onTouchStart { value in
            completion(value)
        }
    }
    public func onTouchEnd(_ completion: @escaping (JSObject) -> Void) -> any Page {
        Div { 
            self 
        }.onTouchEnd { value in
            completion(value)
        }
    }
    public func onTouchMove(_ completion: @escaping (JSObject) -> Void) -> any Page {
        Div { 
            self 
        }.onTouchMove { value in
            completion(value)
        }
    }
    public func onDragStart(_ completion: @escaping (JSObject) -> Void) -> any Page {
        Div { 
            self 
        }.onDragStart { value in
            completion(value)
        }
    }
    public func onDragOver(_ completion: @escaping (JSObject) -> Void) -> any Page {
        Div { 
            self 
        }.onDragOver { value in
            completion(value)
        }
    }
    public func onDrop(_ completion: @escaping (JSObject) -> Void) -> any Page {
        Div { 
            self 
        }.onDrop { value in
            completion(value)
        }
    }

}


