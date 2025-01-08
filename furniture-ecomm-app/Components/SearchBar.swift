import SwiftUI

struct SearchBar: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var text: String = ""
    
    var body: some View {
        HStack {
            HStack {
                CustomSystemImage(imageName: "magnifyingglass", sideLength: 20)
                    .padding(.leading)
                    .foregroundStyle(Color.darkNeutralGray)
                
                TextField("Search", text: $text)
                    .padding()
            }
            .background(.aliceBlue)
            .background(Color.kSecondary(for: colorScheme))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            CustomSystemImage(imageName: "camera", sideLength: 20)
                .aspectRatio(contentMode: .fit)
                .padding()
                .foregroundStyle(.white)
                .background(Color.kPrimary(for: colorScheme))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    SearchBar()
}
