import SwiftUI

extension Color {
    static func kPrimary(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .light ? .saddleBrown : .peru
    }
    
    static func kSecondary(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .light ? .sandyBrown : .saddleBrown
    }

    static func kAccent(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .light ? .steelBlue : .skyBlue
    }
    
    static func kLightAccent(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .light ? .aliceBlue : .darkSlateBlue
    }
    
    static func kBackground(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .light ? .ivory : .offBlack
    }

    static func kText(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .light ? .charcoal : .almostWhite
    }
    
    static func kNeutral(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .light ? .gainsboroGray : .darkNeutralGray
    }
    
    static func kIconNeutral(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .light ? .darkNeutralGray : .gray
    }
    
    static func kActiveTint(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .light ? .rust : .burntOrange
    }
    
    static func kTabBarBackground(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .light ? .mutedCharcoal : .jetBlack
    }
}
