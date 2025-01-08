import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.kBackground(for: colorScheme).ignoresSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 20) {
                    AppBar()
                    SearchBar()
                    ProductsSlider()
                    
                    HStack {
                        Text("New Arrivals")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.kText(for: colorScheme))
                        
                        Spacer()
                        
                        NavigationLink {
                            ProductsView()
                        } label: {
                            CustomSystemImage(imageName: "circle.grid.2x2.fill", sideLength: 20)
                                .foregroundStyle(Color.kPrimary(for: colorScheme))
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(productList) { product in
                                NavigationLink {
                                    ProductDetailsView(product: product)
                                } label: {
                                    ProductCard(product: product)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(CartManager())
}
