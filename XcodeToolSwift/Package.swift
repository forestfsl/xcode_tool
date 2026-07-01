// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XcodeToolSwift",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "XcodeToolSwift",
            targets: ["XcodeToolSwift"]),
    ],
    targets: [
        .target(
            name: "XcodeToolSwift",
            dependencies: []),
        .testTarget(
            name: "XcodeToolSwiftTests",
            dependencies: ["XcodeToolSwift"]),
    ]
)
