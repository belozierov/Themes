// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Themes",
	platforms: [.iOS(.v11)],
    products: [
        .library(name: "Themes",
				 targets: ["ColorTheme", "FontTheme"]),
    ],
    targets: [
		.target(name: "Shared"),
        .target(name: "ColorTheme", dependencies: ["Shared"]),
		.target(name: "FontTheme", dependencies: ["Shared"]),
    ]
)
