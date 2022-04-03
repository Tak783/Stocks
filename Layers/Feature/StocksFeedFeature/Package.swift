// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StocksFeedFeature",
    products: [
        .library(
            name: "StocksFeedFeature",
            targets: [
                "StocksFeedFeature"
            ]
        ),
    ],
    dependencies: [
        .package(name: "CoreFoundational", path: "../Core/CoreFoundational"),
        .package(name: "CoreTesting", path: "../Core/CoreTesting"),
        .package(name: "CoreNetworking", path: "../CoreComponents/CoreNetworking")
    ],
    targets: [
        .target(
            name: "StocksFeedFeature",
            dependencies: [
                "CoreFoundational",
                "CoreNetworking"
            ]
        ),
        .testTarget(
            name: "StocksFeedFeatureTests",
            dependencies: [
                "StocksFeedFeature",
                "CoreTesting",
                "CoreNetworking",
            ]
        ),
    ]
)
