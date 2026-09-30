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
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/AMADocScanMrziOS-2.0.7.zip",
            checksum: "ff4de13730112f43809962d5061f47da1e772102ad1020674717025f1ea18ced"
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
