//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com 
//

import SwiftUI

struct RatingsSizesDetailView: View {
  // MARK: - PROPERTY
  
  @EnvironmentObject var shop: Shop
  let sizes: [String] = ["XS", "S", "M", "L", "XL"]
  let feedback = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var selectedRating: Int = 0
  @State private var selectedSize: String = UserDefaults.standard.string(forKey: "selectedSize") ?? ""
  
  // MARK: - BODY
  
  var body: some View {
    HStack(alignment: .top, spacing: 3, content: {
      // RATINGS
      VStack(alignment: .leading, spacing: 3, content: {
        Text("Ratings")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(colorGray)
        
        HStack(alignment: .center, spacing: 3, content: {
          ForEach(1...5, id: \.self) { item in
            Button(action: {
              feedback.impactOccurred()
              selectedRating = item
            }, label: {
              Image(systemName: item <= selectedRating ? "star.fill" : "star")
                .frame(width: 28, height: 28, alignment: .center)
                .background(colorGray.cornerRadius(5))
                .foregroundColor(item <= selectedRating ? .yellow : .white)
            })
          }
        })
      })
      
      Spacer()
      
      // SIZES
      VStack(alignment: .trailing, spacing: 3, content: {
        Text("Sizes")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(colorGray)
        
        HStack(alignment: .center, spacing: 5, content: {
          ForEach(sizes, id: \.self) { size in
            Button(action: {
              feedback.impactOccurred()
              selectedSize = size
              UserDefaults.standard.set(size, forKey: "selectedSize")
            }, label: {
              SizeButtonView(size: size, isSelected: selectedSize == size)
            })
          }
        })
      })
    }) //: HSTACK
  }
}

struct SizeButtonView: View {
  // MARK: - PROPERTIES
  @EnvironmentObject var shop: Shop
  let size: String
  let isSelected: Bool
  
  // MARK: - BODY
  var body: some View {
    Text(size)
      .font(.footnote)
      .fontWeight(.heavy)
      .foregroundColor(isSelected ? .white : .gray)
      .frame(width: 28, height: 28, alignment: .center)
      .background(
        ZStack {
          if isSelected {
            Color(
              red: shop.selectedProduct?.red ?? sampleProduct.red,
              green: shop.selectedProduct?.green ?? sampleProduct.green,
              blue: shop.selectedProduct?.blue ?? sampleProduct.blue
            )
          } else {
            Color.white
          }
        }
        .cornerRadius(5)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 5)
          .stroke(
            isSelected ? 
              Color(
                red: shop.selectedProduct?.red ?? sampleProduct.red,
                green: shop.selectedProduct?.green ?? sampleProduct.green,
                blue: shop.selectedProduct?.blue ?? sampleProduct.blue
              ) : colorGray,
            lineWidth: 2
          )
      )
  }
}

// MARK: - PREVIEW

struct RatingsSizesDetailView_Previews: PreviewProvider {
  static var previews: some View {
    RatingsSizesDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
