import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var tabState: TabState
    
    init() {
        // hide default UI tab appearance
        UITabBar.appearance().isHidden = true
    }
    
    // coordinated animation involving matched geo effects; used for smooth transitions between diff layouts or views
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $tabState.currentTab) {
            HomeScreen()

            Text("Search View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Search)
            Text("Notifications View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Notifications)
            
            CartView()
                .padding(.horizontal)
                .tag(Tab.Cart)
            
            Text("Profile View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Profile)
        }
        .overlay(
            VStack {
                Spacer()
                TabBar(animation: animation)
            }
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    ContentView()
        .environmentObject(CartManager())
        .environmentObject(TabState())
}
