import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            if cartManager.items.count > 0 {
                ForEach(cartManager.items) { item in
                    CartProductView(item: item)
                }
                
                HStack {
                    Text("Total")
                        .foregroundStyle(Color.kText(for: .light))
                    
                    Spacer()
                    
                    Text("$ \(cartManager.totalPrice).00")
                        .foregroundStyle(Color.kText(for: .light))
                }
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 30)
                
                ApplePayButton(buttonType: .checkout, action: {})
            } else {
                Text("Your Cart is Empty")
                    .foregroundStyle(Color.kText(for: .light))
                    .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("My Cart")
        .background(Color.kBackground(for: .light))
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
