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
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/mdi-mob-sdk-doc-scanner-ios-1.0.0-rc02.zip",
            checksum: "4216c29c77a8ddac5834f8e9a209bb12ce199296db4c9379a8827542bc01a649"
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
