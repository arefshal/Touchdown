//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com 
//

import SwiftUI

struct QuantityFavouriteDetailView: View {
  // MARK: - PROPERTY
  
  @EnvironmentObject var shop: Shop
  @State private var counter: Int = 1
  let feedback = UIImpactFeedbackGenerator(style: .medium)
  
  // MARK: - BODY
  
  var body: some View {
    HStack(alignment: .center, spacing: 6, content: {
      Button(action: {
        if counter > 1 {
          feedback.impactOccurred()
          counter -= 1
        }
      }, label: {
        Image(systemName: "minus.circle")
      })
      
      Text("\(counter)")
        .fontWeight(.semibold)
        .frame(minWidth: 36)
      
      Button(action: {
        if counter < 100 {
          feedback.impactOccurred()
          counter += 1
        }
      }, label: {
        Image(systemName: "plus.circle")
      })
      
      Spacer()
      
      Button(action: {
        feedback.impactOccurred()
      }, label: {
        Image(systemName: "heart.circle")
          .foregroundColor(.pink)
      })
    }) //: HSTACK
    .font(.system(.title, design: .rounded))
    .foregroundColor(.black)
    .imageScale(.large)
    
    // Make the counter available to other views
    .onAppear {
      // Reset counter when showing a new product
      counter = 1
    }
    .onChange(of: counter) { newValue in
      // This will be used when adding to cart
      UserDefaults.standard.set(newValue, forKey: "selectedQuantity")
    }
  }
}

// MARK: - PREVIEW

struct QuantityFavouriteDetailView_Previews: PreviewProvider {
  static var previews: some View {
    QuantityFavouriteDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
