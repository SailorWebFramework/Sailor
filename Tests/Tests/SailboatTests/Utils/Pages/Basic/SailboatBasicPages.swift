//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat

struct SailboatBasic0UpdatePage: Page {
    @State var myNum: Int = 0
    var body: some Page {
        TDiv {
            TButton("myNum: \(myNum)")
                .onClick {
                    myNum += 1
                }
        }
    }
}

struct SailboatBasic1UpdatePage: Page {
    @State var myNum: Int = 0
    var body: some Page {
        TDiv {
            
            if myNum % 4 == 0 {
                TDiv("Im Here")
            }
            
            TButton("myNum: \(myNum)")
                .onClick {
                    myNum += 1
                }
        }
    }
}

struct SailboatBasic2UpdatePage: Page {
    @State var myNum: Int = 0
    var body: some Page {
        TDiv {
            
            if myNum % 4 == 0 {
                TDiv("Im Here")
                TDiv("its: \(myNum)")
            }
            
            TButton("myNum: \(myNum)")
                .onClick {
                    myNum += 1
                }
        }
    }
}

struct SailboatBasic3UpdatePage: Page {
    @State var myNum: Int = 0
    var body: some Page {
        TDiv {
            
            if myNum % 4 == 0 {
                TDiv("Im Here")
                TDiv("its: \(myNum)")
            } else {
                TDiv("Not Here")
            }
            
            TButton("myNum: \(myNum)")
                .onClick {
                    myNum += 1
                }
        }
    }
}

struct SailboatBasic4UpdatePage: Page {
    @State var myNum: Int = 0
    var body: some Page {
        TDiv {
            
            if myNum % 4 == 0 {
                TDiv("One")
                if myNum % 4 == 0 {
                    TDiv("Two")
                    if myNum % 4 == 0 {
                        TDiv("Three")
                    }
                }
            }
            
            TButton("myNum: \(myNum)")
                .onClick {
                    myNum += 1
                }
        }
    }
}

struct SailboatBasicSubTest: Page {
    @Binding var myNum: Int

    var body: some Page {
        TDiv("#: \(myNum)")
    }
}

struct SailboatBasic5UpdatePage: Page {
    @State var myNum: Int = 0
    var body: some Page {
        TDiv {
            
            if myNum % 4 == 0 {
                SailboatBasicSubTest(myNum: $myNum)
            }
            
            TButton("myNum: \(myNum)")
                .onClick {
                    myNum += 1
                }
        }
    }
}
