// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "QuotesAPI",
    products: [
        .library(name: "QuotesAPI", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        
        // 🔵 PostgreSQL Database
        .package(url: "https://github.com/vapor/fluent-postgres-driver", from: "1.0.0"),
        
        // Leaf - web interface
        .package(url: "https://github.com/vapor/leaf", from: "3.0.0"),
    ],
    targets: [
        .target(name: "App", dependencies: ["Leaf", "FluentPostgreSQL", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

