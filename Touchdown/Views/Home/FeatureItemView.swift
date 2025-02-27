//
//  FeatureItemView.swift
//  Touchdown
//
//  Created by Aref Shalchi on 2/26/25.
//

import SwiftUI

struct FeatureItemView: View {
    // MARK: - PROPERTIES
    
    let player: Player
    @Binding var isAnimating: Bool
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.white.opacity(0.5)
                .cornerRadius(12)
                .shadow(radius: 4)
            
            Image(player.image)
                .resizable()
                .scaledToFit()
                .padding(10)
                .scaleEffect(isAnimating ? 0.9 : 1.0)
                .opacity(isAnimating ? 0.8 : 1.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(isAnimating ? 0.5 : 0), lineWidth: 1)
                        .scaleEffect(isAnimating ? 1.1 : 1.0)
                        .opacity(isAnimating ? 1.0 : 0.0)
                )
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isAnimating)
    }
}

// MARK: - PREVIEW
struct FeatureItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureItemView(player: samplePlayer, isAnimating: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
