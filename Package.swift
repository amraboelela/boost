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
            checksum: "44adf8518868670fd1895785a12bcaad3cc00b441dfcd0d89a17ecd8eca29cb5"
        )
    ]
)
