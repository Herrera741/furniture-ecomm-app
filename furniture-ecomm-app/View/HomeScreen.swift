//
//  HomeScreen.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 12/30/24.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white.ignoresSafeArea(.all)
                
                VStack(spacing: 20) {
                    AppBar()
                    SearchBar()
                    ImageSlider()
                    
                    HStack {
                        Text("New Arrivals")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Image(systemName: "circle.grid.2x2.fill")
                            .foregroundStyle(Color("kPrimary"))
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
