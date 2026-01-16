// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "blocksay",
    targets: [
        .executableTarget(
            name: "blocksay"
        ),
        .testTarget(
            name: "blocksayTests",
            dependencies: ["blocksay"]
        ),
    ]
)
