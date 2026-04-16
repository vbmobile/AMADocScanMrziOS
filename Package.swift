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
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", exact: "1.0.0-rc23"),
        .package(url: "https://github.com/vbmobile/AMADocScanneriOS", from: "4.1.10"),
    ],
    targets: [
        .binaryTarget(
            name: "mdi-mob-sdk-doc-scanner-ios",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/mdi-mob-sdk-doc-scanner-ios-1.0.0-rc17.zip",
            checksum: "48d3f73e46df2d373f81462dee4f48fc02489d147e20e6061cb234e90c9b14b4"
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
