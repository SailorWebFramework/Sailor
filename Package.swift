// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sailor",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Sailor",
            targets: ["Sailor"]),
        .executable(name: "Playground", targets: ["Playground"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
//        .package(url: "https://github.com/scinfu/SwiftSoup", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.0.0")),
        .package(url:"https://github.com/swiftwasm/JavaScriptKit", .upToNextMajor(from: "0.18.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Sailor",
            dependencies: ["JavaScriptKit"],
            path: "Sources"
        ),
        .executableTarget(
            name: "Playground",
            dependencies: [
                "Sailor",
                // .product(name: "JavaScriptKit", package: "JavaScriptKit"),
                // .product(name: "JavaScriptEventLoop", package: "JavaScriptKit")
            ],
            path: "Playground"
        ),
        .testTarget(
            name: "SailorTests",
            dependencies: ["Sailor"]),
    ]
)
