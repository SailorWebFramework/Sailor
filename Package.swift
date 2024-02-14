// swift-tools-version: 5.8
import PackageDescription
let package = Package(
    name: "Sailor",
//    platforms: [
//        .macOS(.v10_15)
//    ],
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
        .package(url:"https://github.com/swiftwasm/JavaScriptKit", from: "0.18.0") // 0.15.0
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
            path: "Playground",
            resources: [
                //⛵Sailor Generated Resources (DONT REMOVE THIS COMMENT)
//                .process("Resources/"),
//                .process("Resources/Assests/")
                //⛵End (DONT REMOVE THIS COMMENT)
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
