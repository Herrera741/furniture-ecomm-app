import SwiftUI

struct ColorDotView: View {
    let color: Color
    
    var body: some View {
        color
            .frame(width: 35, height: 35)
            .clipShape(Circle())
    }
}

#Preview {
    ColorDotView(color: Color.blue)
}
