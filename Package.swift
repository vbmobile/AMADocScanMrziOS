// swift-tools-version: 6.2
import PackageDescription
//
let package = Package(
    name: "AMADocScanMrziOS",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AMADocScanMrziOS",
            targets: ["AMADocScanMrziOSWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .upToNextMinor(from: "2.0.2")),
        .package(url: "https://github.com/vbmobile/AMADocScanneriOS", .exact("5.0.2"))
    ],
    targets: [
        .binaryTarget(
            name: "AMADocScanMrziOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/AMADocScanMrziOS-2.0.5.zip",
            checksum: "ae94a58fee313db8e1ca54daa21c465e4e1a13b05250256d711bf70ce42b5f7a"
        ),
        .target(
            name: "AMADocScanMrziOSWrapper",
            dependencies: [
                .target(name: "AMADocScanMrziOS"),
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                .product(name: "AMADocScanneriOS", package: "AMADocScanneriOS"),
            ],
            path: "Sources",
            sources: ["AMADocScanMrziOS.swift"]
        )
    ]
)
