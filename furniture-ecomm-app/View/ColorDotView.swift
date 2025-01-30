import SwiftUI

struct ColorDotView: View {
    @Environment(\.colorScheme) var colorScheme
    let color: Color
    let isSelected: Bool
    let forCartView: Bool
    
    var body: some View {
        ZStack {
            if isSelected {
                Circle()
                    .stroke(colorScheme == .light ? .mutedCharcoal : .almostWhite,
                            lineWidth: 3)
                    .frame(width: forCartView ? 30 : 40,
                           height: forCartView ? 35 : 40)
            }
            
            Circle()
                .fill(color)
                .frame(width: forCartView ? 20 : 30,
                       height: forCartView ? 20 : 30)
        }
    }
}

#Preview {
    ColorDotView(color: Color.blue, isSelected: true, forCartView: true)
}
