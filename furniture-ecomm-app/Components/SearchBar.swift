import SwiftUI

struct SearchBar: View {
    @State private var text: String = ""
    
    var body: some View {
        HStack {
            HStack {
                CustomSystemImage(imageName: "magnifyingglass", sideLength: 20)
                    .padding(.leading)
                
                TextField("Search", text: $text)
                    .padding()
            }
            .background(Color("kSecondary"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            CustomSystemImage(imageName: "camera", sideLength: 20)
                .aspectRatio(contentMode: .fit)
                .padding()
                .foregroundStyle(.white)
                .background(Color("kPrimary"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    SearchBar()
}
