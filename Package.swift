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
        .library(
            name: "Sailboat",
            targets: ["Sailboat"]),
        .executable(name: "Playground", targets: ["Playground"])

    ],
    dependencies: [
        .package(url:"https://github.com/swiftwasm/JavaScriptKit", from: "0.15.0") // 0.18.0
    ],
    targets: [
        .target(
            name: "Sailor",
            dependencies: [
                "Sailboat",
                .product(name: "JavaScriptKit", package: "JavaScriptKit")
            ],
            path: "Sailor"
        ),
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
            path: "Playground"
        ),
        .testTarget(
            name: "Tests",
            dependencies: [
                "Sailboat"
            ],
            path: "Tests"//,
//            swiftSettings: [
//                .unsafeFlags(["-enforce-exclusivity=none"])
//            ]
        ),
    ]
)
