// swift-tools-version:5.8.0

import PackageDescription

let package = Package(
    name: "SunToggle",
    platforms: [
        .iOS(.v16),
        .macOS(.v10_13),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "SunToggle",
            targets: ["SunToggle"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SunToggle",
            dependencies: []),
    ]
)
