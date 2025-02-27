//
//  LogoView.swift
//  Touchdown
//
//  Created by Aref Shalchi on 2/26/25.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack(spacing: 4) {
            Text("TOUCH")
                .font(.headline)
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Image("logo-dark")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20, alignment: .center)
            
            Text("DOWN")
                .font(.headline)
                .fontWeight(.black)
                .foregroundColor(.black)
        } //: HSTACK
    }
}

#Preview {
    LogoView()
        .previewLayout(.sizeThatFits)
        .padding()
}
