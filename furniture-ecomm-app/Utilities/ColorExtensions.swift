import SwiftUI

extension Color {
    static func kPrimary(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? Color("peru") : Color("saddleBrown")
    }
    
    static func kSecondary(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? Color("saddleBrown") : Color("sandyBrown")
    }

    static func kAccent(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? Color("skyBlue") : Color("steelBlue")
    }
    
    static func kBackground(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? Color("offBlack") : Color("ivory")
    }

    static func kText(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? Color("almostWhite") : Color("charcoal")
    }
    
    static func kNeutral(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? Color("darkNeutralGray") : Color("gainsboroGray")
    }
}
