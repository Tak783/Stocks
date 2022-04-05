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
        .package(
            name: "CoreFoundational",
            path: "../Core/CoreFoundational"
        ),
        .package(
            name: "CoreTesting",
            path: "../Core/CoreTesting"
        ),
        .package(
            name: "CoreNetworking",
            path: "../CoreComponents/Sources/CoreNetworking"
        ),
        .package(
            name: "MockNetworking",
            path: "../CoreComponents/Sources/MockNetworking"
        ),
        .package(
            name: "CashAppFoundation",
            path: "../CoreCashApp/Sources/CashAppFoundation"
        )
    ],
    targets: [
        .target(
            name: "StocksFeedFeature",
            dependencies: [
                "CoreFoundational",
                "CoreNetworking",
                "CashAppFoundation",
            ]
        ),
        .testTarget(
            name: "StocksFeedFeatureTests",
            dependencies: [
                "CoreTesting",
                "StocksFeedFeature",
                "CoreNetworking",
                "MockNetworking",
                "CashAppFoundation"
            ],
            resources: [
                .copy("Resources/Stock.json"),
                .copy("Resources/StocksFeed.json"),
                .copy("Resources/EmptyStocksFeed.json"),
                .copy("Resources/MalformedJSON.json"),
                .copy("Resources/MalformedStocksFeed.json")
            ]
        ),
    ]
)
