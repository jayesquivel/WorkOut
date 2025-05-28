//
//  SwiftUIView.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 5/25/25.
//

import SwiftUI

struct MainAppView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            
            Text("Log")
                .tabItem{
                    Label("Log", systemImage: "rectangle.and.pencil.and.ellipsis")
                }
            
            Text ("History")
                .tabItem{
                    Label("Hisotry", systemImage: "clock.fill")
                }
            
            Text("Settings")
                .tabItem{
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}
#Preview {
    MainAppView()
}
