//
//  SearchBar.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 12/30/24.
//

import SwiftUI

struct SearchBar: View {
    @State private var text: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                
                TextField("Search", text: $text)
                    .padding()
            }
            .background(Color("kSecondary"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Image(systemName: "camera")
                .padding()
                .foregroundStyle(.white)
                .background(Color("kPrimary"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    SearchBar()
}
