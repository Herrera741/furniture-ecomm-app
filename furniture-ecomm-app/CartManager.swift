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
    let MAX_ITEMS = 50
    
    func addItemToCart(for product: Product, quantity: Int = 1) {
        guard quantity <= MAX_ITEMS else { return }
        
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += quantity
        } else {
            items.append(CartItem(product: product, quantity: quantity))
        }
        
        updateCartTotals()
    }
    
    func removeItemFromCart(for product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
        
        updateCartTotals()
    }
    
    func removeAllOfProductFromCart(_ product: Product) {
        items.removeAll { $0.product.id == product.id }
            updateCartTotals()
    }
    
    private func calculateTotalPrice() {
        totalPrice = items.reduce(0) { $0 + ($1.product.price * $1.quantity) }
    }
    
    private func calculateTotalItems() {
        totalItems = items.reduce(0) { $0 + $1.quantity }
    }
    
    private func updateCartTotals() {
        calculateTotalItems()
        calculateTotalPrice()
    }
}
