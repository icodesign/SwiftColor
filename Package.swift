// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftColor",
    platforms: [
       .macOS("10.10"),
       .iOS("9.0"),
       .watchOS("2.0"),
       .tvOS("9.0")
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftColor",
            targets: ["SwiftColor"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftColor",
            dependencies: []),
        .testTarget(
            name: "SwiftColorTests",
            dependencies: ["SwiftColor"]),
    ]
)
