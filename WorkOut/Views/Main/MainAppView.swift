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
            Text("Start Workout")
                .tabItem{
                    Label("WorktOut!", systemImage: "dumbbell")
                }
            Text ("History")
                .tabItem{
                    Label("Hisotry", systemImage: "clock.fill")
                }
            
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .background(Color.black.opacity(0.9))
        .onAppear{
            setupTabBarAppearance()
        }
    }
    
    private func setupTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        
        // Add Dark background for floating effect
        tabBarAppearance.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        
        // Normal state styling
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.white.withAlphaComponent(0.6)
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.white.withAlphaComponent(0.6)
        ]
        
        // Selected Styling
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        // Floating effects with shadow and rounded corners
        UITabBar.appearance().layer.shadowColor = UIColor.black.cgColor
        UITabBar.appearance().layer.shadowOffset = CGSize(width: 0, height: -3)
        UITabBar.appearance().layer.shadowOpacity = 0.4
        UITabBar.appearance().layer.shadowRadius = 10
        UITabBar.appearance().layer.cornerRadius = 20
        UITabBar.appearance().layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
#Preview {
    MainAppView()
}
