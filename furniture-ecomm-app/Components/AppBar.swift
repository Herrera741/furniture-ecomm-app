import SwiftUI

struct AppBar: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CustomSystemImage(imageName: "location.north.fill", sideLength: 15)
                    .padding(.trailing)
                    .foregroundStyle(colorScheme == .light ? .jetBlack : .accentColor)
                
                Text("Los Angeles, CA")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.kText(for: colorScheme))
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            Text("Find the Most \nLuxurious")
                .font(.title)
                .fontWeight(.bold)
            
            + Text(" Furniture")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.kPrimary(for: colorScheme))
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AppBar()
}
