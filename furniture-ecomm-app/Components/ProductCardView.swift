//
//  ProductCardView.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 12/30/24.
//

import SwiftUI

struct ProductCardView: View {
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
                        .padding(.vertical, 1.5)
                    
                    Text(product.supplier)
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .padding(.vertical, 0.5)
                    
                    Text("$ \(product.price)")
                        .fontWeight(.bold)
                }
                
                Button {
                    cartManager.addToCart(product)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundStyle(Color("kPrimary"))
                        .frame(width: 30, height: 30)
                        .padding(.trailing)
                }

            }
        }
        .frame(width: 180, height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ProductCardView(product: productList[0])
        .environmentObject(CartManager())
}
