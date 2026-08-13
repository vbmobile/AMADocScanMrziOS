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
        .package(url: "https://github.com/vbmobile/AMADocScanneriOS", .exact("4.1.13"))
    ],
    targets: [
        .binaryTarget(
            name: "AMADocScanMrziOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/AMADocScanMrziOS-2.0.4.zip",
            checksum: "d3b93f11167b8b88bd7ce265e2400686750fd0f44ecff8a10c01b7c0ed457943"
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
