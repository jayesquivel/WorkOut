//
//  LaunchScreenView.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 5/6/25.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea() // For background color
            VStack(spacing: 20) {
                Image(systemName: "figure.walk.circle.fill") //
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height:100)
                    .foregroundColor(.accentColor)
                Text("WorkOut!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
