//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com 
//

import SwiftUI

struct AddToCartDetailView: View {
  // MARK: - PROPERTY
  
  @EnvironmentObject var shop: Shop
  @State private var selectedSize: String = ""
  let feedback = UIImpactFeedbackGenerator(style: .medium)
  
  // MARK: - BODY
  
  var body: some View {
    Button(action: {
      feedback.impactOccurred()
      
      // Get the selected quantity from UserDefaults
      let quantity = UserDefaults.standard.integer(forKey: "selectedQuantity")
      
      // Get the selected size from UserDefaults
      let size = UserDefaults.standard.string(forKey: "selectedSize") ?? "M"
      
      // Add to cart if we have a product
      if let product = shop.selectedProduct {
        shop.addToCart(product: product, quantity: quantity, size: size)
        
        // Show a brief confirmation and dismiss the product detail
        withAnimation(.easeIn) {
          shop.showingProduct = false
          shop.showingCart = true
        }
      }
    }, label: {
      Spacer()
      Text("Add to cart".uppercased())
        .font(.system(.title2, design: .rounded))
        .fontWeight(.bold)
        .foregroundColor(.white)
      Spacer()
    }) //: BUTTON
    .padding(15)
    .background(
      Color(
        red: shop.selectedProduct?.red ?? sampleProduct.red,
        green: shop.selectedProduct?.green ?? sampleProduct.green,
        blue: shop.selectedProduct?.blue ?? sampleProduct.blue
      )
    )
    .clipShape(Capsule())
  }
}

// MARK: - PREVIEW

struct AddToCartDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AddToCartDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
