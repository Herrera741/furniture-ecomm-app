import SwiftUI

struct ProductDetailOverview: View {
    @Environment(\.colorScheme) var colorScheme
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Product Overview")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom, 15)
            
            HStack {
                Text("Description")
                
                Spacer()
                
                NavigationLink {
                    // TODO: nav to description screen
                    VStack {
                        Text(product.description)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .navigationTitle("Description")
                    .padding(.top, 30)
                } label: {
                    Image(systemName: "chevron.right")
                }
                .foregroundStyle(.jetBlack)
                .padding(.trailing, 10)
            }
            
            Divider()
                .padding(.vertical, 10)

            HStack {
                Text("Specifications")
                
                Spacer()
                
                NavigationLink {
                    // TODO: nav to specifications screen
                    VStack {
                        Text("Specifications")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .navigationTitle("Specifications")
                    .padding(.top, 30)
                } label: {
                    Image(systemName: "chevron.right")
                }
                .foregroundStyle(.jetBlack)
                .padding(.trailing, 10)
            }
            
            Divider()
                .padding(.vertical, 10)
            
            HStack {
                Text("Reviews")
                
                ForEach(0..<5) { index in
                    CustomSystemImage(imageName: "star.fill", renderMode: .monochrome, sideLength: 15)
                        .foregroundStyle(colorScheme == .light ? .jetBlack : .almostWhite)
                }
                
                Text("(4.5)")
                    .foregroundStyle(.gray)
                
                Spacer()
                
                NavigationLink {
                    // TODO: nav to reviews screen
                    VStack {
                        Text("Reviews")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .navigationTitle("Reviews")
                    .padding(.top, 30)
                } label: {
                    Image(systemName: "chevron.right")
                }
                .foregroundStyle(.jetBlack)
                .padding(.trailing, 10)
            }
            .foregroundStyle(Color.kText(for: colorScheme))
            
            Divider()
                .padding(.vertical, 10)
        }
    }
}

#Preview {
    NavigationStack {
        ProductDetailOverview(product: productList[2])
    }
}
