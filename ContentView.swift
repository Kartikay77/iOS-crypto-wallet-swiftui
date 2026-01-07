import SwiftUI
internal import Combine

// 1. Data Model
struct Coin: Codable, Identifiable, Sendable {
    let id: String
    let symbol: String
    let name: String
    let priceUsd: String
    
    var formattedPrice: String {
        guard let price = Double(priceUsd) else { return "$0.00" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: price)) ?? "$0.00"
    }
}

// 2. ViewModel (USES FAKE DATA - NO INTERNET NEEDED)
class CryptoViewModel: ObservableObject {
    @Published var coins: [Coin] = [
        Coin(id: "bitcoin", symbol: "BTC", name: "Bitcoin", priceUsd: "67432.10"),
        Coin(id: "ethereum", symbol: "ETH", name: "Ethereum", priceUsd: "3546.78"),
        Coin(id: "solana", symbol: "SOL", name: "Solana", priceUsd: "145.45"),
        Coin(id: "xrp", symbol: "XRP", name: "XRP", priceUsd: "0.62"),
        Coin(id: "cardano", symbol: "ADA", name: "Cardano", priceUsd: "0.45")
    ]
    
    func fetchCrypto() {
        // No internet required!
    }
}

// 3. The View
struct ContentView: View {
    @StateObject var viewModel = CryptoViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.coins) { coin in
                HStack {
                    VStack(alignment: .leading) {
                        Text(coin.name).font(.headline).fontWeight(.bold)
                        Text(coin.symbol).font(.subheadline).foregroundColor(.gray)
                    }
                    Spacer()
                    Text(coin.formattedPrice).fontWeight(.medium).foregroundColor(.green)
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Crypto Wallet")
        }
    }
}

#Preview {
    ContentView()
}
