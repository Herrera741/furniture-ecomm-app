import SwiftUI

struct ContentView: View {
    @EnvironmentObject var tabState: TabState
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $tabState.currentTab) {
            HomeScreen()
            
            Text("Notifications View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.notifications)
            
            Text("Favorites View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.favorites)
            
            CartView()
                .tag(Tab.cart)
            
            Text("Profile View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.profile)
        }
        .overlay(
            VStack {
                Spacer()
                TabBar()
            }
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    ContentView()
        .environmentObject(TabState())
}
