import SwiftUI

struct TabBar: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var tabState: TabState
    var animation: Namespace.ID
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabButton(tab: tab, animation: animation)
            }
        }
        .padding(.vertical)
        .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
        .background(Color("kSecondary"))
    }
}

struct TabButton: View {
    var tab: Tab
    var animation: Namespace.ID
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var tabState: TabState
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                tabState.currentTab = tab
            }
        } label: {
            ZStack {
                Image(systemName: tabState.currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                    .resizable()
                    .foregroundStyle(Color("kPrimary"))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .background(
                        ZStack {
                            if tabState.currentTab == tab {
                                MaterialEffect(style: .light)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                                Text(tab.Tabname)
                                    .font(.footnote)
                                    .padding(.top, 50)
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
    }
}

#Preview {
    @Previewable
    @Namespace var animation
    return TabBar(animation: animation)
        .environmentObject(CartManager())
        .environmentObject(TabState())
}
