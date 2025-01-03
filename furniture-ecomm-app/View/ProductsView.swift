import SwiftUI

struct ProductsView: View {
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
        }
    }
}

#Preview {
    ProductsView()
        .environmentObject(CartManager())
}
