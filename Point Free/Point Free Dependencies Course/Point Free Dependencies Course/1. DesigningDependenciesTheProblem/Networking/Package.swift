// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]
        ),
        .library(
            name: "NetworkingLive",
            targets: ["NetworkingLive"]
        ),
    ],
    dependencies: [
        .package(name: "Shared", path: "../Shared")
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: ["Shared"]
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking"]
        ),
        .target(
            name: "NetworkingLive",
            dependencies: ["Networking"]
        ),
    ]
)
