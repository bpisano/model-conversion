// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModelConversion",
    products: [
        .library(
            name: "ModelConversion",
            targets: ["ModelConversion"]),
    ],
    targets: [
        .target(
            name: "ModelConversion",
            dependencies: [])
    ]
)
