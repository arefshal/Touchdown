//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Aref Shalchi on 2/26/25.
//

import SwiftUI

struct FeaturedTabView: View {
    // MARK: - PROPERTIES
    @State private var currentTab: Int = 0
    @State private var isAnimating: Bool = false
    @State private var autoScrollTimer: Timer? = nil
    
    // MARK: - FUNCTIONS
    
    private func startAutoScroll() {
        // Create a timer that advances the tab every 3 seconds
        autoScrollTimer = Timer.scheduledTimer(withTimeInterval: 7.0, repeats: true) { _ in
            withAnimation {
                // Move to the next tab, wrapping around if necessary
                currentTab = (currentTab + 1) % players.count
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        TabView(selection: $currentTab) {
            ForEach(0..<players.count, id: \.self) { index in
                FeatureItemView(player: players[index], isAnimating: $isAnimating)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                    .tag(index)
            }
        } //: TAB
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onChange(of: currentTab) { _ in
            // Pulse animation when changing tabs
            isAnimating = true
            
            // Reset animation after a short delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                isAnimating = false
            }
        }
        .onAppear {
            // Start auto-scrolling when the view appears
            startAutoScroll()
        }
        .onDisappear {
            // Stop the timer when the view disappears to prevent memory leaks
            autoScrollTimer?.invalidate()
            autoScrollTimer = nil
        }
    }
}

#Preview {
    FeaturedTabView()
}
