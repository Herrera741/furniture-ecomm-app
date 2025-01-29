import SwiftUI

@main
struct furniture_ecomm_appApp: App {
    @StateObject var cartManager = CartManager()
    @StateObject var tabState = TabState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)
                .environmentObject(tabState)
                .environment(\.screenWidth, ScreenWidthKey.defaultValue)
        }
    }
}
