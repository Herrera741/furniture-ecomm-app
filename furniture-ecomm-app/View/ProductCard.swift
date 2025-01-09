import SwiftUI

struct ProductCard: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        ZStack {
            Color.kSecondary(for: colorScheme).opacity(0.75)
            
            VStack(alignment: .leading) {
                Image(product.image)
                    .resizable()
                    .frame(height: 150)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .font(.headline)
                        
                        Text(product.supplier)
                            .font(.caption)
                            .foregroundColor(colorScheme == .light  ? .darkNeutralGray : .aliceBlue)
                        
                        Text("$ \(product.price)")
                            .foregroundColor(Color.kText(for: colorScheme))
                            .fontWeight(.bold)
                    }
                    .foregroundColor(Color.kText(for: colorScheme))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .trailing) {
                        Button {
                            cartManager.addItemToCart(for: product)
                        } label: {
                            CustomSystemImage(imageName: "plus.circle.fill",
                                              renderMode: .palette,
                                              sideLength: 30)
                            .foregroundStyle(.white, Color.kPrimary(for: colorScheme))
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)
        }
        .frame(width: 175, height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ProductCard(product: productList[0])
        .environmentObject(CartManager())
}
