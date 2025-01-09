import SwiftUI

struct ProductsSlider: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var currentIndex = 0
    var slides: [Product] = productList
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .trailing) {
                Image(slides[currentIndex].image)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            
            HStack {
                ForEach(slides.indices, id: \.self) { index in
                    Circle()
                        .fill(self.currentIndex == index ? .rust : .ivory)
                        .frame(width: 10, height: 10)
                }
            }
            .padding()
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 8, repeats: true) { timer in
                if self.currentIndex + 1 == self.slides.count {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
            }
        }
    }
}

#Preview {
    ProductsSlider()
}
