import SwiftUI

struct TabButton: View {
    @EnvironmentObject var tabState: TabState
    @Environment(\.colorScheme) var colorScheme
    let tab: Tab
    let numItemsInCart: Int
    var animation: Namespace.ID
    
    var body: some View {
        Button {
            tabState.currentTab = tab
        } label: {
            VStack {
                ZStack(alignment: .top) {
                    CustomSystemImage(imageName: tabState.currentTab == tab ? tab.imageName + ".fill" : tab.imageName,
                                      renderMode: .monochrome,
                                      sideLength: tabState.currentTab == tab ? 30 : 20)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(
                        tabState.currentTab == tab ? .almostWhite : Color.kNeutral(for: .light))
                    .background {
                        if tabState.currentTab == tab {
                            Circle()
                                .fill(Color.kActiveTint(for: colorScheme))
                                .frame(width: 55, height: 55)
                                .offset(x: tab == .cart ? 3 : 0,
                                        y: -1)
                                .matchedGeometryEffect(id: "activeTab", in: animation)
                        }
                    }
                    
                    if tab == .cart && numItemsInCart > 0 {
                        CustomSystemImage(imageName: "\(numItemsInCart).circle.fill",
                                          renderMode: .palette,
                                          sideLength: 18)
                        .foregroundStyle(.white,
                                         tabState.currentTab == tab ? .jetBlack : .red)
                        .offset(x: 15, y: -8)
                        .shadow(radius: 10)
                    }
                }
                
                Text(tab.rawValue)
                    .font(.caption)
                    .foregroundStyle(
                        tabState.currentTab == tab ? .almostWhite : .white)
                    .padding(.top, tabState.currentTab == tab ? 5 : 0)
                    .opacity(tabState.currentTab == tab ? 0 : 1)
                    .frame(height: tabState.currentTab == tab ? 0 : nil)
                    
            }
        }
    }
}

#Preview {
    @Previewable @Namespace var animation
    TabButton(tab: .cart, numItemsInCart: 5, animation: animation)
        .environmentObject(TabState())
}
