//
//  ProductGridView.swift
//  Touchdown
//
//  Created by Aref Shalchi on 2/26/25.
//

import SwiftUI

struct ProductGridView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    let feedback = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - BODY
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: 15) {
            ForEach(products) { product in
                ProductItemView(product: product, onTapGesture: {
                    feedback.impactOccurred()
                    withAnimation(.easeOut) {
                        shop.selectedProduct = product
                        shop.showingProduct = true
                    }
                })
                .padding(.horizontal, 10)
            } //: LOOP
        } //: GRID
        .padding(.horizontal)
    }
}

// MARK: - PREVIEW
struct ProductGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGridView()
            .environmentObject(Shop())
            .padding()
            .background(colorBackground)
    }
}
