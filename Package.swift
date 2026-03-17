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
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/mdi-mob-sdk-doc-scanner-ios-1.0.0-rc03.zip",
            checksum: "9be0f60846776eda3daf919dcc3c57307d66cb35c1b717a7482065147531a191"
        ),
        .target(
            name: "AMADocScanMrziOS",
            dependencies: ["mdi-mob-sdk-doc-scanner-ios",
                           .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                           .product(name: "AMADocScanneriOS", package: "AMADocScanneriOS"),],
            path: "Sources"
        )
    ]
)
