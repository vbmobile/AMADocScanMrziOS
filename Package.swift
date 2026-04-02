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
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", exact: "1.0.0-rc10"),
        .package(url: "https://github.com/vbmobile/AMADocScanneriOS", from: "4.1.10"),
    ],
    targets: [
        .binaryTarget(
            name: "mdi-mob-sdk-doc-scanner-ios",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrziOS/mdi-mob-sdk-doc-scanner-ios-1.0.0-rc10.zip",
            checksum: "77d567502a63cf57be767499ba037179c00d5735eebbe7439a5851bcb709e6a2"
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
