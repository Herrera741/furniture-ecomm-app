import SwiftUI

struct CustomButton: View {
    let text: String
    let bgColor: Color
    let fgColor: Color
    let isOutlined: Bool
    var action: () -> Void
    
    init(text: String,
         bgColor: Color = Color("kPrimary"),
         fgColor: Color = .white,
         isOutlined: Bool = false,
         action: @escaping () -> Void) {
        self.text = text
        self.bgColor = bgColor
        self.fgColor = fgColor
        self.isOutlined = isOutlined
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .foregroundStyle(isOutlined ? bgColor : fgColor)
                .fontWeight(.semibold)
                .background(
                    ZStack {
                        if isOutlined {
                            RoundedRectangle(cornerRadius: 12).stroke(bgColor, lineWidth: 2)
                        } else {
                            bgColor
                        }
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CustomButton(text: "Continue Shopping", action: {})
            .padding()
    CustomButton(text: "View Cart", isOutlined: true, action: {})
            .padding()
}
