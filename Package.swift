// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Sailor",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Sailor",
            targets: ["Sailor"]
        )
    ],
    dependencies: [
        .package(url:"https://github.com/swiftwasm/JavaScriptKit", from: "0.18.0"),
        .package(url:"https://github.com/SailorWebFramework/Sailboat", from: "0.3.0"),
//        .package(name: "Sailboat", path: "../Sailboat")
    ],
    targets: [
        .target(
            name: "Sailor",
            dependencies: [
                "Sailboat",
                "SailorShared",
                .target(name: "SailorWeb", condition: .when(platforms: [.wasi]))
                // more targets here
            ]
        ),
        .target(
            name: "SailorShared",
            dependencies: [
                "Sailboat"
            ]
        ),
        .target(
            name: "SailorWeb",
            dependencies: [
                "Sailboat",
                "SailorShared",
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
                .product(name: "JavaScriptEventLoop", package: "JavaScriptKit")
            ]
        ),
    ]
)
