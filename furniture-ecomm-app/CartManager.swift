import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}

class CartManager: ObservableObject {
    @Published private(set) var items: [CartItem] = []
    @Published var totalPrice: Int = 0
    @Published var totalItems: Int = 0
    
    func addToCart(_ product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(product: product, quantity: 1))
        }
        
        calculateTotalItems()
        calculateTotalPrice()
    }
    
    func removeFromCart(_ product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
        
        calculateTotalItems()
        calculateTotalPrice()
    }
    
    private func calculateTotalPrice() {
        totalPrice = items.reduce(0) { $0 + ($1.product.price * $1.quantity) }
    }
    
    private func calculateTotalItems() {
        totalItems = items.reduce(0) { $0 + $1.quantity }
    }
}
