//
//  CartProductView.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 1/1/25.
//

import SwiftUI

struct CartProductView: View {
    var product: Product
    
    var body: some View {
        HStack {
            Image(product.image)
                .resizable()
                .frame(width: 100, height: 55)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                
                Text("$ \(product.price)")
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundStyle(.red)
        }
        .padding()
        .background(Color("kSecondary"))
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    CartProductView(product: productList[0])
}
