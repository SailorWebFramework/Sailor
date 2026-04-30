// swift-tools-version: 6.0
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
        ),
        .library(
            name: "SailorServer",
            targets: ["SailorServer"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.47.0"),
        .package(url: "https://github.com/SailorWebFramework/Sailboat", branch: "feature-fin"),
    ],
    targets: [
        .target(
            name: "Sailor",
            dependencies: [
                "Sailboat",
                "SailorShared",
                .target(name: "SailorWeb", condition: .when(platforms: [.wasi]))
                // more targets here
            ],
            exclude: ["README.md"]
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
        .target(
            name: "SailorServer",
            dependencies: [
                "Sailor",
                "Sailboat",
                "SailorShared"
            ]
        ),
        .testTarget(
            name: "SailorTests",
            dependencies: [
                "Sailor",
                "SailorServer",
                .product(name: "Sailboat", package: "Sailboat")
            ],
            path: "Tests/SailorTests"
        ),
        .testTarget(
            name: "SailorIntegrationTests",
            dependencies: [
                "Sailor",
                "SailorServer",
                .product(name: "Sailboat", package: "Sailboat")
            ],
            path: "Tests/SailorIntegrationTests"
        ),
    ]
)
