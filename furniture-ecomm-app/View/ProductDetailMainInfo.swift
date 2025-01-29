import SwiftUI

struct ProductDetailMainInfo: View {
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.colorScheme) var colorScheme
    @Binding var quantity: Int
    let product: Product
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.kText(for: colorScheme))
                
                Text(product.supplier)
                    .font(.headline)
                    .foregroundStyle(colorScheme == .light ? .mutedCharcoal : .gainsboroGray)
                
                Text("SKU: 12345")
                    .font(.subheadline)
                    .foregroundStyle(colorScheme == .light ? .mutedCharcoal : .gainsboroGray)
                    .fontWeight(.medium)
                
                HStack {
                    ForEach(0..<5) { index in
                        CustomSystemImage(imageName: "star.fill", renderMode: .multicolor, sideLength: 15)
                    }
                    
                    Text("(4.5)")
                        .foregroundStyle(colorScheme == .light ? .mutedCharcoal : .gainsboroGray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .trailing, spacing: 25) {
                Text("$\(product.price).00")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.kText(for: colorScheme))
                
                HStack(spacing: 15) {
                    // TODO: confirm cart manager methods working correctly for below actions
                    Button {
                        quantity -= 1
                    } label: {
                        CustomSystemImage(imageName: quantity == 1 ? "trash" : "minus.square",renderMode: .palette,
                                          sideLength: 20)
                        .foregroundStyle(quantity == 1 ? .red : Color.kPrimary(for: colorScheme))
                    }
                    
                    Text("\(quantity)")
                    
                    Button {
                        quantity += 1
                    } label: {
                        CustomSystemImage(imageName: "plus.square.fill",
                                          renderMode: .palette,
                                          sideLength: 20)
                        .foregroundStyle(.white, Color.kPrimary(for: colorScheme))
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProductDetailMainInfo(quantity: .constant(1), product: productList[2])
}
