//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Aref Shalchi on 2/26/25.
//

import SwiftUI

struct BrandGridView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: columnSpacing) {
                ForEach(brands) { brand in
                    BrandItemView(brand: brand)
                        .frame(width: 200, height: 100)
                        .onTapGesture {
                            feedback.impactOccurred()
                        }
                }
            } //: GRID
            .frame(height: 200)
            .padding(15)
        } //: SCROLL
    }
}

// MARK: - PREVIEW
#Preview {
    BrandGridView()
        .previewLayout(.sizeThatFits)
        .background(colorBackground)
}
