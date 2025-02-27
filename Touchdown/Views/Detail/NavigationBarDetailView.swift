//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com 
//

import SwiftUI

struct NavigationBarDetailView: View {
  // MARK: - PROPERTY
  
  @EnvironmentObject var shop: Shop
  let feedback = UIImpactFeedbackGenerator(style: .medium)
    
  // MARK: - BODY
  
  var body: some View {
    HStack {
      Button(action: {
        withAnimation(.easeIn) {
          feedback.impactOccurred()
          shop.selectedProduct = nil
          shop.showingProduct = false
        }
      }, label: {
        Image(systemName: "chevron.left")
          .font(.title)
          .foregroundColor(.white)
      })
      
      Spacer()
      
      Button(action: {
        feedback.impactOccurred()
        shop.showingCart = true
      }, label: {
        ZStack {
          Image(systemName: "cart")
            .font(.title)
            .foregroundColor(.white)
          
          if shop.cartItems.count > 0 {
            ZStack {
              Circle()
                .fill(Color.red)
              
              Text("\(shop.cartItemCount)")
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            }
            .frame(width: 20, height: 20)
            .offset(x: 13, y: -10)
          }
        }
      })
    } //: HSTACK
  }
}

// MARK: - PREVIEW

struct NavigationBarDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Color.gray)
  }
}
