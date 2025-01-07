import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        ZStack {
            Color("kSecondary")
            
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading) {
                    Image(product.image)
                        .resizable()
                        .frame(width: 170, height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    Text(product.name)
                        .font(.headline)
                        .foregroundStyle(.black)
                        .padding(.vertical, 1.5)
                    
                    Text(product.supplier)
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .padding(.vertical, 0.5)
                    
                    Text("$ \(product.price)")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                }
                
                Button {
                    cartManager.addItemToCart(for: product)
                } label: {
                    CustomSystemImage(imageName: "plus.circle.fill",
                                      renderMode: .palette,
                                      sideLength: 30)
                    .foregroundStyle(.white, Color("kPrimary"))
                    .padding(.trailing, 5)
                }
            }
            .padding(.bottom, 5)
        }
        .frame(width: 180, height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ProductCard(product: productList[0])
        .environmentObject(CartManager())
}
