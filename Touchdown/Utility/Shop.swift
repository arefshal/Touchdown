//
//  Shop.swift
//  Touchdown
//
//  Created by Aref Shalchi on 2/26/25.
//

import Foundation

// Cart Item Model
struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    let quantity: Int
    let selectedSize: String
    
    var totalPrice: Int {
        return product.price * quantity
    }
    
    var formattedTotalPrice: String {
        return "$\(totalPrice)"
    }
}

class Shop: ObservableObject {
    // Product Selection
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
    
    // Cart
    @Published var cartItems: [CartItem] = []
    @Published var showingCart: Bool = false
    
    // Cart Functions
    func addToCart(product: Product, quantity: Int, size: String) {
        let newItem = CartItem(product: product, quantity: quantity, selectedSize: size)
        cartItems.append(newItem)
    }
    
    func removeFromCart(at indexSet: IndexSet) {
        cartItems.remove(atOffsets: indexSet)
    }
    
    func clearCart() {
        cartItems.removeAll()
    }
    
    // Cart Calculations
    var cartTotal: Int {
        cartItems.reduce(0) { $0 + $1.totalPrice }
    }
    
    var formattedCartTotal: String {
        return "$\(cartTotal)"
    }
    
    var cartItemCount: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }
}
