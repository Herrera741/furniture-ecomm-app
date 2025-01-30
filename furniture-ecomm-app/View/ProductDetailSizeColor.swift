import SwiftUI

struct ProductDetailSizeColor: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedSize: Int
    @State var selectedColor = 1
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Size")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kText(for: colorScheme))
                
                HStack {
                    Button {
                        selectedSize = 92
                    } label: {
                        Text("92")
                            .fontWeight(.semibold)
                            .foregroundStyle(selectedSize == 92 ? .white : .darkNeutralGray)
                            .frame(width: 70, height: 45)
                            .background(selectedSize == 92 ? Color.saddleBrown : Color.gainsboroGray)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                    }
                    
                    Button {
                        selectedSize = 105
                    } label: {
                        Text("105")
                            .fontWeight(.semibold)
                            .foregroundStyle(selectedSize == 105 ? .white : .darkNeutralGray)
                            .frame(width: 70, height: 45)
                            .background(selectedSize == 105 ? Color.saddleBrown : Color.gainsboroGray)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text("Color")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kText(for: colorScheme))
                
                HStack {
                    Button {
                        selectedColor = 1
                    } label: {
                        ColorDotView(color: .skyBlue,
                                     isSelected: selectedColor == 1 ? true : false,
                                     forCartView: false)
                    }

                    Button {
                        selectedColor = 2
                    } label: {
                        ColorDotView(color: .gainsboroGray,
                                     isSelected: selectedColor == 2 ? true : false,
                                     forCartView: false)
                    }
                    
                    Button {
                        selectedColor = 3
                    } label: {
                        ColorDotView(color: .charcoal,
                                     isSelected: selectedColor == 3 ? true : false,
                                     forCartView: false)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ProductDetailSizeColor(selectedSize: .constant(92))
}
