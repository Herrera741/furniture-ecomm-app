import SwiftUI

struct TabBar: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var tabState: TabState
    @Environment(\.colorScheme) var colorScheme
    var animation: Namespace.ID
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabButton(tab: tab, animation: animation)
            }
        }
        .padding(.vertical)
        .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
        .background(Color.kSecondary(for: colorScheme))
    }
}

struct TabButton: View {
    var tab: Tab
    var animation: Namespace.ID
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var tabState: TabState
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                tabState.currentTab = tab
            }
        } label: {
            ZStack {
                CustomSystemImage(imageName: tabState.currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue,
                                  renderMode: .monochrome,
                                  sideLength: 25)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.kPrimary(for: colorScheme))
                .background(
                    ZStack {
                        if tabState.currentTab == tab {
                            MaterialEffect(style: .light)
                                .clipShape(Circle())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                            Text(tab.Tabname)
                                .font(.footnote)
                                .padding(.top, 50)
                                .foregroundStyle(Color.kPrimary(for: colorScheme))
                        }
                    }
                )
                .offset(y: tabState.currentTab == tab ? -15 : 0)
                
                if tab == .Cart && cartManager.totalItems > 0 {
                    Text("\(cartManager.totalItems)")
                        .font(.caption2)
                        .frame(width: 15, height: 15)
                        .background(.red)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                        .offset(x: 10, y: tabState.currentTab == tab ? -25 : -10)
                }
            }
        }
        .padding(.vertical, 20)
        .background(Color.kTabBarBackground(for: colorScheme))
        .animation(.interactiveSpring(response: 0.3, dampingFraction: 0.8, blendDuration: 0.9), value: tabState.currentTab)
    }
}

#Preview {
    @Previewable
    @Namespace var animation
    return TabBar(animation: animation)
        .environmentObject(CartManager())
        .environmentObject(TabState())
}
