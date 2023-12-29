// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Sailor",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Sailor",
            targets: ["Sailor"]),
        .executable(name: "Playground", targets: ["Playground"])

    ],
    dependencies: [
        .package(url:"https://github.com/swiftwasm/JavaScriptKit", from: "0.15.0") // 0.18.0
    ],
    targets: [
        .target(
            name: "Sailor",
            dependencies: [
                .product(name: "JavaScriptKit", package: "JavaScriptKit")
            ],
            path: "Sources"
        ),
        .executableTarget(
            name: "Playground",
            dependencies: [
                "Sailor"
            ],
            path: "Playground"
        ),
        .testTarget(
            name: "SailorLibraryTests",
            dependencies: [
//                "Sailor",
                .product(name: "JavaScriptKit", package: "JavaScriptKit")

            ]
        ),
    ]
)
