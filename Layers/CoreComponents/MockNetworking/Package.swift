// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MockNetworking",
    products: [
        .library(
            name: "MockNetworking",
            targets: [
                "MockNetworking"
            ]
        ),
    ],
    dependencies: [
        .package(
            name: "CoreFoundational",
            path: "../Core/CoreFoundational"
        ),
        .package(
            name: "CoreTesting",
            path: "../CoreTesting"
        )
    ],
    targets: [
        .target(
            name: "MockNetworking",
            dependencies: []),
        .testTarget(
            name: "MockNetworkingTests",
            dependencies: [
                "MockNetworking"
            ]
        ),
    ]
)
