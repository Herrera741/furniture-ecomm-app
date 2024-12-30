//
//  Product.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 12/29/24.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var supplier: String
    var price: Int
}

var productList = [
    Product(name: "Blue Couch",
            image: "furn1",
            description: "",
            supplier: "Living Spaces",
            price: 300),
    Product(name: "Gray Couch",
            image: "furn2",
            description: "",
            supplier: "IKEA",
            price: 300),
    Product(name: "Tan Chairs",
            image: "furn3",
            description: "",
            supplier: "Home Depot",
            price: 300),
    Product(name: "Leather Couch",
            image: "furn4",
            description: "",
            supplier: "Bobs Furniture",
            price: 300),
    Product(name: "Round Table",
            image: "furn5",
            description: "",
            supplier: "Amazon",
            price: 300),
    Product(name: "Kitchen Island",
            image: "furn6",
            description: "",
            supplier: "Kirklands",
            price: 300),
    Product(name: "Brown Dresser",
            image: "furn7",
            description: "",
            supplier: "Target",
            price: 300)
]
