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
            checksum: "1da5e0b84599228bf4f3fd297965dff60792e25c4fd41fc992f6c1f23a20625b"
        )
    ]
)
