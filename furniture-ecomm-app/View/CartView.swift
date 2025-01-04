import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.items.count > 0 {
                ForEach(cartManager.items) { item in
                    CartProductView(item: item)
                }
                
                HStack {
                    Text("Total")
                    
                    Spacer()
                    
                    Text("$ \(cartManager.totalPrice)")
                }
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 30)
                
                ApplePayButton(buttonType: .checkout, action: {})
            } else {
                Text("Your Cart is Empty")
            }
        }
        .navigationTitle("My Cart")
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
