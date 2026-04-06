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
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", exact: "1.0.0-rc12"),
        .package(url: "https://github.com/vbmobile/AMADocScanneriOS", from: "4.1.10"),
    ],
    targets: [
        .binaryTarget(
            name: "mdi-mob-sdk-doc-scanner-ios",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/mdi-mob-sdk-doc-scanner-ios-1.0.0-rc11.zip",
            checksum: "d6f76fe1ee813b8cdf64d9f7c8f6734b2285e1fda670a525d85a40f939acfea5"
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
