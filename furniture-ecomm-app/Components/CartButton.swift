//
//  CartButton.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 12/30/24.
//

import SwiftUI

struct CartButton: View {
    var numOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "bag.fill")
                .foregroundStyle(.black)
                .padding(2)
            
            if numOfProducts > 0 {
                Text("\(numOfProducts)")
                    .font(.caption2)
                    .frame(width: 10, height: 10)
                    .padding(1.5)
                    .background(.green)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                    
            }
        }
    }
}

#Preview {
    CartButton(numOfProducts: 1)
}
