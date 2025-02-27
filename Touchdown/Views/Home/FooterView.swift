//
//  FooterView.swift
//  Touchdown
//
//  Created by Aref Shalchi on 2/26/25.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack {
            Text("We offer the most cutting edge, comfortable, lightweight and durable football helmets in the market at affordable prices.")
                .foregroundColor(colorGray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
                .font(.footnote)
            Image("logo-lineal")
                .renderingMode(.template)
                .foregroundColor(colorGray)
                .layoutPriority(0)
                .font(.title2)
            Text("  copyright Aref Shalchi © 2025. All rights reserved.")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(colorGray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
        } //: VSTACK

    }
}

#Preview {
    FooterView()
}
