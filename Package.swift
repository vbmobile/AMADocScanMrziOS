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
        .package(url: "https://github.com/vbmobile/AMADocScanneriOS", exact:"4.1.10"),
    ],
    targets: [
        .binaryTarget(
            name: "AMADocScanMrziOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/AMADocScanMrziOS-1.0.0.zip",
            checksum: "5c4a6c8d5082e2cb022f33a69ba7f6400da0c30ea82848f93879211d186cb968"
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
