//
//  CartView.swift
//  Touchdown
//
//  Created by Aref Shalchi on 2/26/25.
//

import SwiftUI

struct CartView: View {
  // MARK: - PROPERTY
  
  @EnvironmentObject var shop: Shop
  @Environment(\.presentationMode) var presentationMode
  
  // MARK: - BODY
  
  var body: some View {
    NavigationView {
      VStack {
        // CART ITEMS
        if shop.cartItems.isEmpty {
          VStack(spacing: 20) {
            Image(systemName: "cart")
              .font(.system(size: 60))
              .foregroundColor(.gray)
            
            Text("Your cart is empty")
              .font(.title2)
              .fontWeight(.semibold)
            
            Text("Browse our products and add something to your cart")
              .font(.body)
              .foregroundColor(.gray)
              .multilineTextAlignment(.center)
              .padding(.horizontal)
            
            Button(action: {
              let feedback = UIImpactFeedbackGenerator(style: .medium)
              feedback.impactOccurred()
              presentationMode.wrappedValue.dismiss()
            }) {
              Text("Continue Shopping")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
            }
            .padding(.top, 20)
          }
          .padding()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
          List {
            ForEach(shop.cartItems) { item in
              CartItemView(item: item)
            }
            .onDelete { indexSet in
              shop.removeFromCart(at: indexSet)
            }
          }
          .listStyle(InsetGroupedListStyle())
          
          // TOTAL AND CHECKOUT
          VStack(spacing: 20) {
            HStack {
              Text("Total:")
                .font(.title2)
                .fontWeight(.semibold)
              
              Spacer()
              
              Text(shop.formattedCartTotal)
                .font(.title2)
                .fontWeight(.bold)
            }
            .padding(.horizontal)
            
            Button(action: {
              let feedback = UIImpactFeedbackGenerator(style: .medium)
              feedback.impactOccurred()
              // Checkout process would go here
              shop.clearCart()
              presentationMode.wrappedValue.dismiss()
            }) {
              Text("Checkout")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
          }
          .padding(.top)
          .background(Color.white)
          .cornerRadius(30, corners: [.topLeft, .topRight])
          .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -5)
        }
      }
      .navigationBarTitle("Shopping Cart", displayMode: .inline)
      .navigationBarItems(trailing: Button(action: {
        let feedback = UIImpactFeedbackGenerator(style: .medium)
        feedback.impactOccurred()
        presentationMode.wrappedValue.dismiss()
      }) {
        Image(systemName: "xmark")
          .font(.title2)
      })
    }
  }
}

// MARK: - PREVIEW

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView()
      .environmentObject(Shop())
  }
}

// MARK: - CART ITEM VIEW

struct CartItemView: View {
  let item: CartItem
  @EnvironmentObject var shop: Shop
  
  var body: some View {
    HStack(spacing: 15) {
      // PRODUCT IMAGE
      ZStack {
        Rectangle()
          .fill(Color(red: item.product.red, green: item.product.green, blue: item.product.blue))
          .frame(width: 80, height: 80)
          .cornerRadius(12)
        
        Image(item.product.image)
          .resizable()
          .scaledToFit()
          .frame(width: 60, height: 60)
      }
      
      // PRODUCT DETAILS
      VStack(alignment: .leading, spacing: 5) {
        Text(item.product.name)
          .font(.headline)
          .lineLimit(2)
        
        HStack {
          Text("Size: \(item.selectedSize)")
            .font(.subheadline)
            .foregroundColor(.gray)
          
          Spacer()
          
          Text("Qty: \(item.quantity)")
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        
        Text(item.formattedTotalPrice)
          .font(.headline)
          .fontWeight(.bold)
      }
    }
    .padding(.vertical, 8)
  }
}
