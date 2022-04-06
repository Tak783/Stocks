// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreFoundational",
    products: [
        .library(
            name: "CoreFoundational",
            targets: ["CoreFoundational"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CoreFoundational",
            dependencies: []),
        .testTarget(
            name: "CoreFoundationalTests",
            dependencies: ["CoreFoundational"]),
    ]
)
