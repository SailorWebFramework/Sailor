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
            targets: ["SailorCore"])
    ],
    dependencies: [
        .package(url:"https://github.com/swiftwasm/JavaScriptKit", from: "0.18.0"),
        // TODO: automate this, but for now switch below comment when debugging
        //.package(path: "../Sailboat")
        .package(url:"https://github.com/SailorWebFramework/Sailboat", from: "0.2.0"),

    ],
    targets: [
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
            ],
            path: "SailorShared"
        ),
        .target(
            name: "SailorWeb",
            dependencies: [
                "Sailboat",
                "SailorShared",
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
                .product(name: "JavaScriptEventLoop", package: "JavaScriptKit")
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

    ]
)
