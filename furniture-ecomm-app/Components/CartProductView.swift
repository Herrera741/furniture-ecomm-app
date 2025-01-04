import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var item: CartItem
    
    var body: some View {
        HStack {
            Image(item.product.image)
                .resizable()
                .frame(width: 100, height: 65)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 3) {
                Text(item.product.name)
                
                HStack {
                    Text("Color: ")
                    
                    ColorDotView(color: Color(UIColor.systemCyan))
                }
                
                Text("$ \(item.product.price)")
            }
            .fontWeight(.semibold)
            
            Spacer()
            
            HStack(spacing: 0) {
                Button {
                    cartManager.removeFromCart(item.product)
                } label: {
                    Image(systemName: item.quantity == 1 ? "trash" : "minus.square")
                }
                .foregroundStyle(item.quantity == 1 ? .red : Color("kPrimary"))
                
                
                Text("\(item.quantity)")
                    .padding(.horizontal)
                     
                Button {
                    cartManager.addToCart(item.product)
                } label: {
                    Image(systemName: "plus.square.fill")
                }
                .foregroundStyle(Color("kPrimary"))
            }
            .font(.title3)
        }
        .padding()
        .background(Color("kSecondary"))
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    CartProductView(item: CartItem(product: productList[0], quantity: 10))
        .environmentObject(CartManager())
}
