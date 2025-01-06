import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var tabState: TabState
    @State private var quantity = 1
    @State private var isAddedToCartSheetShowing = false
    @State private var didTapViewCart = false
    var product: Product
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.white
                
                VStack(spacing: 20) {
                    ZStack(alignment: .topTrailing) {
                        Image(product.image)
                            .resizable()
                            .background(ignoresSafeAreaEdges: .top)
                            .frame(height: 300)
                        
                        Button {
                            // TODO: handle setting product as a favorite
                        } label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.red)
                                .padding(.top, 50)
                                .padding(.trailing, 30)
                        }

                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.name)
                            
                            Spacer()
                            
                            Text("$ \(product.price).00")
                                .padding(.horizontal)
                                .background(Color("kSecondary"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        
                        HStack {
                            ForEach(0..<5) { index in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(Color.yellow)
                            }
                            
                            Text("(4.5)")
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            HStack(spacing: 15) {
                                Button {
                                    quantity -= 1
                                } label: {
                                    Image(systemName: "minus.square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                                .foregroundStyle(quantity == 1 ? Color(uiColor: .systemGray4) : Color("kPrimary"))
                                .disabled(quantity == 1 ? true : false)
                                
                                Text("\(quantity)")
                                     
                                Button {
                                    quantity += 1
                                } label: {
                                    Image(systemName: "plus.square.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                                .foregroundStyle(Color("kPrimary"))
                            }
                        }
                        
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                        
                        Text(product.description)
                        
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
                        
                        Button {
                            cartManager.addItemToCart(for: product, quantity: quantity)
                            isAddedToCartSheetShowing = true
                        } label: {
                            Text("Add to Cart")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color("kPrimary"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .disabled(false)
                        .sheet(isPresented: $isAddedToCartSheetShowing, onDismiss: {
                            if didTapViewCart {
                                tabState.currentTab = .Cart
                            }
                        }, content: {
                            AddedToCartSheet(isSheetShowing: $isAddedToCartSheetShowing,
                                             didTapViewCart: $didTapViewCart,
                                             product: product,
                                             quantity: quantity)
                                .presentationDetents([.medium, .fraction(0.5)])
                        })
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .offset(y: -30)
                    
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProductDetailsView(product: productList[0])
        .environmentObject(CartManager())
        .environmentObject(TabState())
}
