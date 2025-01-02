//
//  CartView.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 1/1/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products) { product in
                    CartProductView(product: product)
                }
                
                HStack {
                    Text("Total")
                    
                    Spacer()
                    
                    Text("$ \(cartManager.total)")
                }
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 30)
            } else {
                Text("Your Cart is Empty")
            }
        }
        .navigationTitle("My Cart")
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
