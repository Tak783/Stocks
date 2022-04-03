// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreTesting",
    products: [
        .library(
            name: "CoreTesting",
            targets: ["CoreTesting"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CoreTesting",
            dependencies: []
        ),
    ]
)
