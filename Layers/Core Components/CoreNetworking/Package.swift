// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreNetworking",
    products: [
        .library(
            name: "CoreNetworking",
            targets: ["CoreNetworking"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CoreNetworking",
            dependencies: []),
        .testTarget(
            name: "CoreNetworkingTests",
            dependencies: ["CoreNetworking"]),
    ]
)
