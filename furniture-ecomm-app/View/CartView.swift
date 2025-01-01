//
//  CartView.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 12/30/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) { product in
                    CartProductView(product: product)
                }
                
                HStack {
                    Text("Total ")
                    
                    Spacer()
                    
                    Text("$ \(cartManager.total).00")
                        .fontWeight(.semibold)
                }
                .font(.title2)
                .padding(.top, 30)
                
            } else {
                Text("Your Cart is Empty")
            }
        }
        .navigationTitle(Text("My Cart"))
        
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
