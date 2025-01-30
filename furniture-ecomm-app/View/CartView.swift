import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack {
                if cartManager.items.count > 0 {
                    ForEach(cartManager.items) { item in
                        CartProductView(item: item)
                        
                        if colorScheme == .light {
                            Divider()
                        }
                    }
                    
                    HStack {
                        Text("Total")
                        
                        Spacer()
                        
                        Text("$ \(cartManager.totalPrice).00")
                    }
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.kText(for: colorScheme))
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                    
                    ApplePayButton(buttonType: .checkout, action: {})
                } else {
                    Text("Cart is Empty")
                        .foregroundStyle(Color.kText(for: .light))
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 20)
        }
        .navigationTitle("My Cart")
        .background(Color.kBackground(for: colorScheme))
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
