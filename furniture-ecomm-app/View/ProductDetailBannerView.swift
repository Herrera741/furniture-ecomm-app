import SwiftUI

struct ProductDetailBannerView: View {
    @Environment(\.screenWidth) var screenWidth
    @Binding var isFavorite: Bool
    let product: Product
    let numImages: CGFloat
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(product.image)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Text("1 of 5")
                    .foregroundStyle(.almostWhite)
                    .frame(width: 80, height: 50)
                    .background(.darkNeutralGray)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 5)
                    )
                    .padding([.top, .trailing], 20)
                    .shadow(radius: 2)
            }
            .frame(width: screenWidth, height: screenWidth)
        }
    }
}

#Preview {
    ProductDetailBannerView(isFavorite: .constant(false),
                            product: productList[4],
                            numImages: 5)
}
