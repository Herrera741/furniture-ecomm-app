import SwiftUI

struct TabBar: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var tabState: TabState
    @Environment(\.colorScheme) var colorScheme
    @Namespace private var animation
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabButton(tab: tab,
                          numItemsInCart: cartManager.totalItems,
                          animation: animation)
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical, 20)
        .background(Color.kTabBarBackground(for: colorScheme))
        .animation(.interactiveSpring(response: 0.3, dampingFraction: 0.8, blendDuration: 0.9), value: tabState.currentTab)
    }
}

#Preview {
    TabBar()
        .environmentObject(CartManager())
        .environmentObject(TabState())
}
