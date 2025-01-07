import SwiftUI

struct ProductsView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var cartManager: CartManager
    var columns = [GridItem(.adaptive(minimum: 150), spacing: 15)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(productList) { product in
                        NavigationLink {
                            ProductDetailsView(product: product)
                        } label: {
                            ProductCard(product: product)
                        }
                    }
                }
            }
            .padding()
            .background(Color.kBackground(for: colorScheme))
        }
    }
}

#Preview {
    ProductsView()
        .environmentObject(CartManager())
}
