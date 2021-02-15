// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "boost",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "boost",
            targets: ["boost"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "boost",
            url: "https://github.com/amraboelela/boost/releases/download/v1.70.0/boost.xcframework.zip",
            checksum: "2f026f752d026cab14a15ca196b38c84688c80c0538a97599792a494b206490b"
        )
    ]
)
