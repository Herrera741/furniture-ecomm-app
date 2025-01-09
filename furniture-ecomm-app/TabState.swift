import Foundation

class TabState: ObservableObject {
    @Published var currentTab: Tab = .home
}

enum Tab: String, CaseIterable {
    case home = "Home"
    case notifications = "Notifications"
    case cart = "Cart"
    case favorites = "Favorites"
    case profile = "Profile"
    
    var imageName: String {
        switch self {
        case .home:
            return "house"
        case .notifications:
            return "bell"
        case .favorites:
            return "heart"
        case .cart:
            return "cart"
        case .profile:
            return "person"
        }
    }
}
