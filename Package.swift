// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Sourcery",
    platforms: [
       .macOS(.v10_11),
    ],
    products: [
        .executable(name: "sourcery", targets: ["Sourcery"]),
        .library(name: "SourceryRuntime", targets: ["SourceryRuntime"]),
        .library(name: "SourceryJS", targets: ["SourceryJS"]),
        .library(name: "SourcerySwift", targets: ["SourcerySwift"]),
        .library(name: "SourceryFramework", targets: ["SourceryFramework"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Commander.git", .exact("0.7.1")),
        // PathKit needs to be exact to avoid a SwiftPM bug where dependency resolution takes a very long time.
        .package(url: "https://github.com/kylef/PathKit.git", .exact("0.9.2")),
        .package(url: "https://github.com/jpsim/SourceKitten.git", .exact("0.30.0")),
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit.git", .exact("2.7.0")),
        .package(url: "https://github.com/tuist/xcodeproj", .exact("4.3.1")),
    ],
    targets: [
        .target(
            name: "Sourcery",
            dependencies: [
                .target(name: "SourceryFramework"),
                .target(name: "SourceryRuntime"),
                .target(name: "SourceryJS"),
                .target(name: "SourcerySwift"),
                .target(name: "TryCatch"),
                .product(name: "Commander", package: "Commander"),
                .product(name: "PathKit", package: "PathKit"),
                .product(name: "SourceKittenFramework", package: "SourceKitten"),
                .product(name: "StencilSwiftKit", package: "StencilSwiftKit"),
                .product(name: "xcproj", package: "xcproj"),
            ],
            path: "Sourcery"
        ),
        .target(
            name: "SourceryRuntime",
            dependencies: [
                .product(name: "SourceKittenFramework", package: "SourceKitten"),
            ],
            path: "SourceryRuntime"
        ),
        .target(
            name: "SourceryUtils",
            dependencies: [
                .product(name: "PathKit", package: "PathKit"),
            ],
            path: "SourceryUtils"
        ),
        .target(
            name: "SourceryFramework",
            dependencies: [
                .target(name: "SourceryRuntime"),
                .target(name: "SourceryUtils"),
                .product(name: "PathKit", package: "PathKit"),
                .product(name: "SourceKittenFramework", package: "SourceKitten"),
            ],
            path: "SourceryFramework"
        ),
        .target(
            name: "SourceryJS",
            dependencies: [
                .product(name: "PathKit", package: "PathKit"),
            ],
            path: "SourceryJS"
        ),
        .target(
            name: "SourcerySwift",
            dependencies: [
                .target(name: "SourceryRuntime"),
                .target(name: "SourceryUtils"),
                .product(name: "PathKit", package: "PathKit"),
            ],
            path: "SourcerySwift"),
        .target(
            name: "TryCatch",
            path: "TryCatch"
        ),
    ]
)
