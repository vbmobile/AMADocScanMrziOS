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
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .upToNextMinor(from: "1.0.0")),
        .package(url: "https://github.com/vbmobile/AMADocScanneriOS", .upToNextMinor(from: "4.1.12")),
    ],
    targets: [
        .binaryTarget(
            name: "AMADocScanMrziOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/AMADocScanMrziOS-1.0.2.zip",
            checksum: "31cd2d1f3c208d4503411f4fc206d4f33a481416b1b0f13edd7cfa207b45c50e"
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
