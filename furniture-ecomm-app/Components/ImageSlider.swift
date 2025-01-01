//
//  ImageSlider.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 12/30/24.
//

import SwiftUI

struct ImageSlider: View {
    @State private var currentIndex = 0
    var slides: [String] = ["furn1","furn2","furn3","furn4","furn5","furn6","furn7"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .trailing) {
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width: .infinity, height: 180)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            
            HStack {
                ForEach(slides.indices, id: \.self) { index in
                    Circle()
                        .fill(self.currentIndex == index ? Color("kPrimary") : Color("kSecondary"))
                        .frame(width: 10, height: 10)
                }
            }
            .padding()
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                if self.currentIndex+1 == self.slides.count {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
            }
        }
    }
}

#Preview {
    ImageSlider()
}
