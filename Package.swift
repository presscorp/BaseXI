// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BaseXI",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "BaseXI",
            targets: ["BaseXI"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BaseXI",
            dependencies: []
        ),
        .testTarget(
            name: "BaseXITests",
            dependencies: ["BaseXI"]
        )
    ]
)
