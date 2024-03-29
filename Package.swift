// swift-tools-version: 5.9
import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "Sailor",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Sailor",
            targets: ["Sailor"]),
        .library(
            name: "Sailboat",
            targets: ["Sailboat"]),
        .executable(name: "Playground", targets: ["Playground"])
    ],
    dependencies: [
        .package(url:"https://github.com/swiftwasm/JavaScriptKit", from: "0.18.0"), // 0.15.0
        .package(url:"https://github.com/swiftwasm/carton", from: "1.0.2")//, // 0.15.0
//        .package(url: "https://github.com/apple/swift-syntax", from: "509.0.0")

    ],
    targets: [
        .target(
            name: "Sailor",
            dependencies: [
                "SailorCore",
//                "SailorMacros",
                "SailorWeb"
            ],
            path: "Sailor"
            
        ),
        .target(
            name: "SailorCore",
            dependencies: [
                "Sailboat",
                "SailorShared",
                .target(name: "SailorWeb", condition: .when(platforms: [.wasi]))
                // more targets here
            ],
            path: "SailorCore"
        ),
        .target(
            name: "SailorShared",
            dependencies: [
                "Sailboat"
                // more targets here
            ],
            path: "SailorShared"
        ),
        .target(
            name: "SailorWeb",
            dependencies: [
                "Sailboat",
                "SailorShared",
                .product(name: "JavaScriptKit", package: "JavaScriptKit")
            ],
            path: "SailorWeb"
        ),
//        .macro(
//            name: "SailorMacros",
//            dependencies: [
//                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
//                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
//                "SailorCore"
//            ],
//            path: "SailorMacros"
//
//        ),
        .target(
            name: "Sailboat",
            dependencies: [],
            path: "Sailboat"
        ),
        .executableTarget(
            name: "Playground",
            dependencies: [
                "Sailor"
            ],
            path: "Playground",
            resources: [
                //🧭Compass Generated Resources (DONT REMOVE THIS COMMENT)
//                .process("Resources/hello.css"),
                .process("Resources/Assets/favicon.ico"),
//                .process("Resources/hello.css"),

                .process("Resources/Global.css")

//                .process("Resources/Assests/")
                //🧭End (DONT REMOVE THIS COMMENT)
            ]
        ),
        .testTarget(
            name: "Tests",
            dependencies: [
                "Sailboat",
                "Sailor"
            ],
            path: "Tests"//,
//            swiftSettings: [
//                .unsafeFlags(["-enforce-exclusivity=none"])
//            ]
        ),
    ]
)
