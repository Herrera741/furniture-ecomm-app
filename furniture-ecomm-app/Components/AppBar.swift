import SwiftUI

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "location.north.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(.trailing)
                
                Text("Los Angeles, CA")
                    .font(.title3)
                    .foregroundStyle(.gray)
            }
            
            Text("Find the Most \nLuxurious")
                .font(.title)
                .fontWeight(.bold)
            
            + Text(" Furniture")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color("kPrimary"))
        }
    }
}

#Preview {
    AppBar()
        .environmentObject(CartManager())
}
