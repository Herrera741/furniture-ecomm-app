import SwiftUI

struct CustomSystemImage: View {
    let imageName: String
    let renderMode: SymbolRenderingMode
    let sideLength: CGFloat
    
    init(imageName: String,
         renderMode: SymbolRenderingMode = .hierarchical,
         sideLength: CGFloat) {
        self.imageName = imageName
        self.renderMode = renderMode
        self.sideLength = sideLength
    }
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .symbolRenderingMode(renderMode)
            .frame(width: sideLength, height: sideLength)
    }
}

#Preview {
    CustomSystemImage(imageName: "xmark.circle.fill", sideLength: 30)
}
