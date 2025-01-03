import SwiftUI

struct ColorDotView: View {
    let color: Color
    
    var body: some View {
        color
            .frame(width: 25, height: 25)
            .clipShape(Circle())
    }
}

#Preview {
    ColorDotView(color: Color.blue)
}
