// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TeamSnapSDK",
    products: [
        .library(name: "TeamSnapSDK", targets: ["TeamSnapSDK"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TeamSnapSDK",
            path: "TeamSnapSDK",
            sources: ["Sources"],
            resources: [.process("Resources")],
            cSettings: [.headerSearchPath("Sources")]
        )
    ]
)
