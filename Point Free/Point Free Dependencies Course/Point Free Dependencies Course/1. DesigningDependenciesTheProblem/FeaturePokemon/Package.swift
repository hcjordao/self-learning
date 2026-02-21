// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "FeaturePokemon",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "FeaturePokemon",
            targets: ["FeaturePokemon"]
        ),
    ],
    dependencies: [
        .package(name: "Networking", path: "../Networking"),
        .package(name: "Shared", path: "../Shared")
    ],
    targets: [
        .target(
            name: "FeaturePokemon",
            dependencies: [
                "Networking",
                "Shared"
            ]
        ),
        .testTarget(
            name: "FeaturePokemonTests",
            dependencies: ["FeaturePokemon"]
        ),
    ]
)
