import SwiftUI

struct ProductDetailsView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var tabState: TabState
    @State private var quantity = 1
    @State private var isAddedToCartSheetShowing = false
    @State private var didTapViewCart = false
    var product: Product
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.kBackground(for: colorScheme)
                
                VStack(spacing: 20) {
                    ZStack(alignment: .topTrailing) {
                        Image(product.image)
                            .resizable()
                            .background(ignoresSafeAreaEdges: .top)
                            .frame(height: 300)
                        
                        Button {
                            // TODO: handle setting product as a favorite
                        } label: {
                            CustomSystemImage(imageName: "heart.fill",
                                              renderMode: .multicolor,
                                              sideLength: 25)
                            .padding(.top, 50)
                            .padding(.trailing, 30)
                        }

                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.name)
                            Color.kText(for: colorScheme)
                            
                            Spacer()
                            
                            Text("$ \(product.price).00")
                                .padding(.horizontal)
                                .background(Color.kSecondary(for: colorScheme))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        
                        HStack {
                            ForEach(0..<5) { index in
                                CustomSystemImage(imageName: "star.fill", renderMode: .multicolor, sideLength: 20)
                            }
                            
                            Text("(4.5)")
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            HStack(spacing: 15) {
                                Button {
                                    quantity -= 1
                                } label: {
                                    CustomSystemImage(imageName: "minus.square", renderMode: .palette, sideLength: 20)
                                        .foregroundStyle(quantity == 1 ? Color(uiColor: .systemGray4) : Color.kPrimary(for: colorScheme))
                                }
                                .disabled(quantity == 1 ? true : false)
                                
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
                        
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                            .foregroundColor(Color.kText(for: colorScheme))
                        
                        Text(product.description)
                            .foregroundColor(Color.kText(for: colorScheme))
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Size")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                
                                VStack(alignment: .leading) {
                                    Text("Height: \(product.height)")
                                    
                                    Text("Width: \(product.width)")
                                    
                                    Text("Diameter: \(product.diameter)")
                                }
                                .foregroundStyle(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Colors")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                
                                HStack {
                                    ColorDotView(color: Color(UIColor.systemCyan))
                                    ColorDotView(color: Color(UIColor.systemBrown))
                                    ColorDotView(color: Color(UIColor.lightGray))
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.vertical)
                        
                        CustomButton(text: "Add to Cart") {
                            cartManager.addItemToCart(for: product, quantity: quantity)
                            isAddedToCartSheetShowing = true
                        }
                        .disabled(false)
                        .sheet(isPresented: $isAddedToCartSheetShowing, onDismiss: {
                            if didTapViewCart {
                                tabState.currentTab = .cart
                            }
                        }, content: {
                            AddedToCartSheet(isSheetShowing: $isAddedToCartSheetShowing,
                                             didTapViewCart: $didTapViewCart,
                                             product: product,
                                             quantity: quantity)
                                .presentationDetents([.medium, .fraction(0.5)])
                                .padding(.top, 20)
                        })
                    }
                    .padding()
                    .background(Color.kBackground(for: colorScheme))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .offset(y: -30)
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ProductDetailsView(product: productList[0])
        .environmentObject(CartManager())
        .environmentObject(TabState())
}
