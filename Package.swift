// swift-tools-version: 6.2
import PackageDescription

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
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .exact("1.0.0-rc02")),
        .package(url: "https://github.com/vbmobile/AMADocScanneriOS", .exact("4.1.10")),
    ],
    targets: [
        .binaryTarget(
            name: "AMADocScanMrziOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/mdi-mob-sdk-doc-scanner-ios-1.0.0-rc01.zip",
            checksum: "7431763ae16046891a0f273f45ab13efee107817be6443094a4926afb11ec814"
        ),
        .target(
            name: "AMADocScanMrziOSWrapper",
            dependencies: ["AMADocScanMrziOS",
                           .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                           .product(name: "AMADocScanneriOS", package: "AMADocScanneriOS"),],
            path: "Sources",
            sources: ["AMADocScanMrziOS.swift"]
        )
    ]
)
