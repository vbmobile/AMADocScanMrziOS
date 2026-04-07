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
            targets: ["AMADocScanMrziOS"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", exact: "1.0.0-rc13"),
        .package(url: "https://github.com/vbmobile/AMADocScanneriOS", from: "4.1.10"),
    ],
    targets: [
        .binaryTarget(
            name: "mdi-mob-sdk-doc-scanner-ios",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/mdi-mob-sdk-doc-scanner-ios-1.0.0-rc12.zip",
            checksum: "fc6be97de5736005ab7f0517ca4c70def2611a00df04bdee40d6d825af6aba1d"
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
