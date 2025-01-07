import SwiftUI

struct AppBar: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CustomSystemImage(imageName: "location.north.fill", sideLength: 15)
                    .padding(.trailing)
                
                Text("Los Angeles, CA")
                    .font(.title3)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            Text("Find the Most \nLuxurious")
                .font(.title)
                .fontWeight(.bold)
            
            + Text(" Furniture")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color("kPrimary"))
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AppBar()
}
