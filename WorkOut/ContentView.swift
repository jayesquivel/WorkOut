//
//  ContentView.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 5/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    
    var body: some View {
        Group {
            if isActive {
                HomeView()
            } else {
                LaunchScreenView()
            }
        }
        .onAppear {
            // This shows the launch screen for 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
