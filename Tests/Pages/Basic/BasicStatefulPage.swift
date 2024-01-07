//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/28/23.
//

import Sailboat

struct BasicStatefulPage0: Page {
    @State var hello: Int = 0
    var body: some Page {
        Div {
            Button("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

struct BasicStatefulPage1: Page {
    @State var hello: Int = 0
    var body: some Page {
        Div {
            if hello % 2 == 0 {
                Div("Inner Div")
            }
            
            Button("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

struct BasicStatefulPage2: Page {
    @State var hello: Int = 0
    var body: some Page {
        Div {
            if hello % 3 == 0 {
                Div("Inner Div")
            } else if hello % 3 == 1 {
                Div("Other Inner Div")
            } else {
                Div("Other Third Div")
            }
            
            Button("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

struct BasicStatefulPage3: Page {
    @State var hello: Int = 0
    var body: some Page {
        Div {
            if hello % 2 == 0 {
                Div("Inner Div")
            } else {
                Div("Other Inner Div")
            }
            
            Button("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

struct BasicStatefulPage4: Page {
    @State var hello: Int = 0
    var body: some Page {
        Div {
            if hello % 2 == 0 {
                Div("Inner Div")
            } else {
                Div("Other Inner Div")
            }
            
            if hello % 2 == 1 {
                Div("Inner Div")
            }
            
            Button("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

struct BasicStatefulPage5: Page {
    @State var hello: Int = 0
    var body: some Page {
        Div {
            if hello % 3 == 0 {
                Div("Inner Div")
                if hello % 2 == 0 {
                    Div("Inner Div")
                    if hello % 4 == 0 {
                        Div("Inner Div")
                    }
                }
            }
            
            Button("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

struct BasicStatefulPage6: Page {
    @State var hello: Int = 0
    var body: some Page {
        Div {
            if hello % 3 == 0 {
                Div("First Inner Div")
            }
            
            if hello % 2 == 0 {
                Div("Second Inner Div")
            }
            
            if hello % 3 == 0 {
                Div("THird Inner Div")
            }
            
            if hello % 4 == 0 {
                Div("Fourth Inner Div")
            } else {
                Div("HELLO Div")
            }
            
            Button("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}
