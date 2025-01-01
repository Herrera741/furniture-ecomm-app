//
//  CartProductView.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 12/30/24.
//

import SwiftUI

struct CartProductView: View {
    var product: Product
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 85)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                Text("$ \(product.price)")
            }
            .font(.headline)
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundStyle(.red)
                .onTapGesture {
                    cartManager.removeFromCart(product)
                }
        }
        .padding()
        .background(Color("kSecondary"))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    CartProductView(product: productList[0])
        .environmentObject(CartManager())
}
