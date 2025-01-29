import SwiftUI
import PassKit

struct ProductDetailsView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var tabState: TabState
    @State private var quantity = 1
    @State private var isAddedToCartSheetShowing = false
    @State private var didTapViewCart = false
    @State private var isFavorite = false
    @State private var selectedSize: Int = 92
    var product: Product
    
    var body: some View {
        ZStack {
            Color.kBackground(for: colorScheme).ignoresSafeArea()
            
            ScrollView {
                ProductDetailBannerView(isFavorite: $isFavorite,
                                        product: product,
                                        numImages: 5)
                VStack(alignment: .leading) {
                    ProductDetailMainInfo(quantity: $quantity, product: product)
                        .padding(.top, 20)
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    ProductDetailSizeColor(selectedSize: $selectedSize)
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    ProductDetailOverview(product: product)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
            
            VStack {
                Spacer()
                
                HStack(spacing: 20) {
                    // Add to Cart button
                    Button(action: {
                        cartManager.addItemToCart(for: product)
                    }) {
                        Label("Add to Cart", systemImage: "cart.badge.plus")
                    }
                    .fontWeight(.semibold)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    ApplePayButton(buttonType: .buy, action: {})
                        .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity, alignment: .bottom)
                .padding(.all, 20)
                .background(
                    Color.gainsboroGray
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: -2)
                )
            } // end VStack
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // TODO: implement search
                } label: {
                    CustomSystemImage(imageName: "magnifyingglass",
                                      renderMode: .monochrome,
                                      sideLength: 25)
                    .foregroundStyle(Color.kText(for: colorScheme))
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isFavorite.toggle()
                } label: {
                    ZStack {
                        CustomSystemImage(imageName: "heart.fill",
                                          renderMode: .palette,
                                          sideLength: 25)
                        .scaledToFit()
                        .foregroundStyle(
                            isFavorite ? (colorScheme == .light ? .jetBlack : .rust) : (colorScheme == .light ? .clear : .jetBlack)
                        )
                        
                        CustomSystemImage(imageName: "heart",
                                          renderMode: .palette,
                                          sideLength: 25)
                        .scaledToFit()
                        .foregroundStyle(
                            colorScheme == .light ? .jetBlack : .almostWhite
                        )
                    }
                }
            }
        }
    }
}
            
//            VStack {
//                Spacer()
//                
//                HStack(spacing: 20) {
//                    // Add to Cart button
//                    Button(action: {
//                        cartManager.addItemToCart(for: product)
//                    }) {
//                        Text("Add to Cart")
//                            .fontWeight(.bold)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                    }
//                    
//                    // Buy with Apple Pay button
//                    Button(action: {
//                        // Trigger Apple Pay logic here
//                    }) {
//                        HStack {
//                            Image(systemName: "applelogo")
//                            Text("Pay")
//                        }
//                        .fontWeight(.bold)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.black)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                    }
//                }
//                .frame(maxWidth: .infinity, maxHeight: 80, alignment: .bottom)
//                .padding(.all, 10)
//                .background(
//                    Color.gainsboroGray
//                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: -2)
//                )
//            } // end VStack






//                        CustomButton(text: "Add to Cart") {
//                            cartManager.addItemToCart(for: product, quantity: quantity)
//                            isAddedToCartSheetShowing = true
//                        }
//                        .disabled(false)
//                        .sheet(isPresented: $isAddedToCartSheetShowing, onDismiss: {
//                            if didTapViewCart {
//                                tabState.currentTab = .cart
//                            }
//                        }, content: {
//                            AddedToCartSheet(isSheetShowing: $isAddedToCartSheetShowing,
//                                             didTapViewCart: $didTapViewCart,
//                                             product: product,
//                                             quantity: quantity)
//                                .presentationDetents([.medium, .fraction(0.5)])
//                                .padding(.top, 20)
//                        })
//                    }
//                    .padding()
//                    .background(Color.kBackground(for: colorScheme))
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                    .offset(y: -30)
//                }
//            }
//        }
//        .ignoresSafeArea(.all)
//    }
//}

#Preview {
    NavigationStack {
        ProductDetailsView(product: productList[0])
            .environmentObject(CartManager())
            .environmentObject(TabState())
    }
}







