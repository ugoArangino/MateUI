// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "MateUI",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "MateUI",
            targets: ["MateUI"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MateUI",
            dependencies: []
        ),
        .testTarget(
            name: "MateUITests",
            dependencies: ["MateUI"]
        ),
    ]
)
