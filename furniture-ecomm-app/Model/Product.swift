import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var supplier: String
    var height: Int
    var width: Int
    var diameter: Int
    var price: Int
}

var productList = [
    Product(name: "Blue Couch",
            image: "furn1",
            description: "This is a blue couch.",
            supplier: "Living Spaces",
            height: 130,
            width: 130,
            diameter: 130,
            price: 300),
    Product(name: "Gray Couch",
            image: "furn2",
            description: "This is a gray couch.",
            supplier: "IKEA",
            height: 130,
            width: 130,
            diameter: 130,
            price: 300),
    Product(name: "Tan Chairs",
            image: "furn3",
            description: "These are tan chairs.",
            supplier: "Home Depot",
            height: 130,
            width: 130,
            diameter: 130,
            price: 300),
    Product(name: "Leather Couch",
            image: "furn4",
            description: "This is a leather couch.",
            supplier: "Bobs Furniture",
            height: 130,
            width: 130,
            diameter: 130,
            price: 300),
    Product(name: "Round Table",
            image: "furn5",
            description: "This is a round table.",
            supplier: "Amazon",
            height: 130,
            width: 130,
            diameter: 130,
            price: 300),
    Product(name: "Kitchen Island",
            image: "furn6",
            description: "This is a kitchen island.",
            supplier: "Kirklands",
            height: 130,
            width: 130,
            diameter: 130,
            price: 300),
    Product(name: "Brown Dresser",
            image: "furn7",
            description: "This is a brown dresser.",
            supplier: "Target",
            height: 130,
            width: 130,
            diameter: 130,
            price: 300)
]
