# iOS Crypto Wallet Dashboard 📱

![Swift 6](https://img.shields.io/badge/Swift-6.0-orange?style=flat-square&logo=swift)
![SwiftUI](https://img.shields.io/badge/UI-SwiftUI-blue?style=flat-square&logo=apple)
![Platform](https://img.shields.io/badge/Platform-iOS_16.0+-lightgrey?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

A high-performance native iOS cryptocurrency tracking application built with **Swift 6** and **SwiftUI**. This project demonstrates modern mobile architecture, type-safe financial data modeling, and strict concurrency safety using the `Sendable` protocol.

![App Screenshot](https://github.com/Kartikay77/iOS-crypto-wallet-swiftui/blob/main/Media/iOS_Finance.PNG?raw=true)

---

## 🚀 Key Features

* **Modern UI/UX**: Built 100% with **SwiftUI**, featuring a clean, list-based interface for financial assets.
* **Swift 6 Concurrency**: Implements strict concurrency checking with the `Sendable` protocol to ensure thread safety for data models (`Coin`, `CoinCapResponse`).
* **MVVM Architecture**: Clean separation of concerns between the View (UI) and ViewModel (Business Logic).
* **Type-Safe Data Modeling**: Robust `Codable` structs for parsing complex financial data.
* **Scalable Design**: Prepared for REST API integration with `URLSession` and asynchronous data fetching.
* **Financial Formatting**: Custom `NumberFormatter` logic to handle currency precision and locale display.

---

## 🛠️ Tech Stack

* **Language**: Swift 6
* **Framework**: SwiftUI
* **Architecture**: MVVM (Model-View-ViewModel)
* **Networking**: URLSession, Combine (ObservableObject)
* **Data**: JSON, Codable
* **Concurrency**: Async/Await, Actors, Sendable

---

## 📂 Architecture Overview

The app follows a clean **MVVM** pattern to ensure testability and scalability:

1.  **Model (`Coin`)**:
    * Immutable, thread-safe data structures conforming to `Identifiable`, `Codable`, and `Sendable`.
    * Handles safe data transformation (e.g., String to Currency format).
2.  **ViewModel (`CryptoViewModel`)**:
    * Manages the state of the application (`@Published` properties).
    * Acts as the source of truth for the UI.
    * (Currently configured with mock data for instant preview/testing).
3.  **View (`ContentView`)**:
    * Declarative UI that observes the ViewModel.
    * Automatically updates when data changes.

---

## 💻 Installation & Run

1.  **Clone the repository**:
    ```bash
    git clone [https://github.com/Kartikay77/iOS-crypto-wallet-swiftui.git](https://github.com/Kartikay77/iOS-crypto-wallet-swiftui.git)
    ```
2.  **Open in Xcode**:
    * Double-click `CryptoTracker.xcodeproj`.
3.  **Run the App**:
    * Select an iPhone Simulator (e.g., iPhone 16 Pro).
    * Press `Cmd + R` or click the **Play** button.

---

## 🔍 Code Highlights

### Swift 6 Strict Concurrency
Ensuring thread safety across execution contexts using `Sendable`:

```swift
// Data models explicitly conform to Sendable for Swift 6 safety
struct Coin: Codable, Identifiable, Sendable {
    let id: String
    let symbol: String
    let name: String
    let priceUsd: String
    
    // Robust formatting logic
    var formattedPrice: String {
        guard let price = Double(priceUsd) else { return "$0.00" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter.string(from: NSNumber(value: price)) ?? "$0.00"
    }
}
```
## MVVM Pattern

### Separation of logic for cleaner views:
```
class CryptoViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    
    // Initialized with mock financial data for immediate UI rendering
    init() {
        self.coins = [
            Coin(id: "bitcoin", symbol: "BTC", name: "Bitcoin", priceUsd: "67432.10"),
            // ...
        ]
    }
}
```
## 🔜 Future Roadmap
[ ] Integration with Live CoinCap REST API.

[ ] CoreData implementation for offline caching.

[ ] Interactive charts using Swift Charts.

[ ] Unit Tests for ViewModel logic.
