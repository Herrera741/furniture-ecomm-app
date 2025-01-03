//
//  ColorDotView.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 1/2/25.
//

import SwiftUI

struct ColorDotView: View {
    let color: Color
    
    var body: some View {
        color
            .frame(width: 25, height: 25)
            .clipShape(Circle())
    }
}

#Preview {
    ColorDotView(color: Color.blue)
}
