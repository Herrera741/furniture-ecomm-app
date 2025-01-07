import SwiftUI

struct AddedToCartSheet: View {
    @Binding var isSheetShowing: Bool
    @Binding var didTapViewCart: Bool
    @EnvironmentObject var tabState: TabState
    let product: Product
    let quantity: Int
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image(product.image)
                        .resizable()
                        .frame(width: 80, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(product.name)
                        
                        HStack {
                            Text("Color: ")
                            ColorDotView(color: Color(UIColor.systemCyan))
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Price: $\(product.price) ea.")
                        Text("Qty: \(quantity)")
                    }
                    .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
                
                VStack(spacing: 5) {
                    CustomButton(text: "Continue Shopping") {
                        isSheetShowing = false
                    }
                    
                    CustomButton(text: "View Cart", isOutlined: true) {
                        didTapViewCart = true
                        isSheetShowing = false
                    }
                }
                .padding(.top, 10)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 10)
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        CustomSystemImage(imageName: "checkmark", sideLength: 20)
                            .foregroundStyle(.green)
                            .fontWeight(.bold)
                        
                        Text("Added to Cart")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isSheetShowing = false
                    }) {
                        CustomSystemImage(imageName: "xmark.circle.fill",
                                          renderMode: .palette,
                                          sideLength: 25)
                            .foregroundStyle(Color(uiColor: .darkGray), Color(uiColor: .systemGray5))
                    }
                }
            }
        }
    }
}

#Preview {
    AddedToCartSheet(isSheetShowing: .constant(true),
                     didTapViewCart: .constant(false),
                     product: productList[0],
                     quantity: 5)
}
