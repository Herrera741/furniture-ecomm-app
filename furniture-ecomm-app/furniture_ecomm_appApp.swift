import SwiftUI

@main
struct furniture_ecomm_appApp: App {
    @StateObject var cartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)
        }
    }
}
