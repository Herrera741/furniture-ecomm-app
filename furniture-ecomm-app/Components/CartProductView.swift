import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var item: CartItem
    
    var body: some View {
        HStack(alignment: .bottom) {
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
            
            VStack(spacing: 10) {
                HStack(spacing: 15) {
                    Button {
                        cartManager.removeItemFromCart(for: item.product)
                    } label: {
                        CustomSystemImage(imageName: item.quantity == 1 ? "trash" : "minus.square",renderMode: .palette,
                                          sideLength: 20)
                        .foregroundStyle(item.quantity == 1 ? .red : Color("kPrimary"))
                    }
                    
                    Text("\(item.quantity)")
                    
                    Button {
                        cartManager.addItemToCart(for: item.product)
                    } label: {
                        CustomSystemImage(imageName: "plus.square.fill",
                                          renderMode: .palette,
                                          sideLength: 20)
                        .foregroundStyle(.white, Color("kPrimary"))
                    }
                }
                
                HStack(spacing: 5) {
                    Button {
                        // TODO: nav to product details view
                    } label: {
                        Text("Edit")
                    }
                    
                    Text("|")

                    Button {
                        cartManager.removeAllOfProductFromCart(item.product)
                    } label: {
                        Text("Remove")
                    }
                }
            }
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
