// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CashAppFoundation",
    products: [
        .library(
            name: "CashAppFoundation",
            targets: [
                "CashAppFoundation"
            ]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CashAppFoundation",
            dependencies: []
        ),
        .testTarget(
            name: "CashAppFoundationTests",
            dependencies: [
                "CashAppFoundation"
            ]
        ),
    ]
)
