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
                    Button {
                        isSheetShowing = false
                    } label: {
                        Text("Continue Shopping")
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color("kPrimary"))
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Button {
                        didTapViewCart = true
                        isSheetShowing = false
                    } label: {
                        Text("View Cart")
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .foregroundStyle(Color("kPrimary"))
                    .fontWeight(.semibold)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("kPrimary"), lineWidth: 2)
                    )
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
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 15, height: 15)
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
                        Image(systemName: "xmark.circle.fill")
                            .renderingMode(.template)
                            .frame(width: 15, height: 15)
                            .foregroundColor(Color(uiColor: .systemGray5))
                            .background(Color(uiColor: .darkGray))
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
