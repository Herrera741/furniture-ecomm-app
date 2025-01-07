import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white.ignoresSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 20) {
                    AppBar()
                    SearchBar()
                    ProductsSlider()
                    
                    HStack {
                        Text("New Arrivals")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        NavigationLink {
                            ProductsView()
                        } label: {
                            CustomSystemImage(imageName: "circle.grid.2x2.fill", sideLength: 20)
                                .foregroundStyle(Color("kPrimary"))
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
