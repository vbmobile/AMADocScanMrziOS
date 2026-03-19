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
            targets: ["AMADocScanMrziOS"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .exact("1.0.0-rc02")),
        .package(url: "https://github.com/vbmobile/AMADocScanneriOS", .exact("4.1.10")),
    ],
    targets: [
        .binaryTarget(
            name: "mdi-mob-sdk-doc-scanner-ios",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/mdi-mob-sdk-doc-scanner-ios-1.0.0-rc04.zip",
            checksum: "7caacd6d7115ae9bc70af6ab00109e79c3901df7c693d02c3ba882882ad4ba6e"
        ),
        .target(
            name: "AMADocScanMrziOS",
            dependencies: [
                "mdi-mob-sdk-doc-scanner-ios",
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                .product(name: "AMADocScanneriOS", package: "AMADocScanneriOS"),
            ],
            path: "Sources"
        )
    ]
)
