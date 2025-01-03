import SwiftUI

struct ProductDetailsView: View {
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
                            
                            HStack {
                                Button {
                                    // TODO: do something
                                } label: {
                                    Image(systemName: "minus.square")
                                }
                                .foregroundStyle(Color("kPrimary"))
                                
                                
                                Text("1")
                                     
                                     
                                Button {
                                    // TODO: do something
                                } label: {
                                    Image(systemName: "plus.square.fill")
                                }
                                .foregroundStyle(Color("kPrimary"))
                            }
                        }
                        
                        Text("Description")
                            .font(.title3)
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
                        
                        ApplePayButton(buttonType: .buy, action: {})
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
}
