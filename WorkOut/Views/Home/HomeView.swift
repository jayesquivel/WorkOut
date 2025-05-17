//
//  HomeView.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 5/13/25.
//
import SwiftUI
import Foundation

struct HomeView: View  {
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .center, spacing: 24){
                    
                    // Placeholders
                    WelcomeBanner()
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    WorkoutStatsChartView()
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    
                    Text("Workout Cards go here")
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                }
                .padding()
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Dashboard")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
    }
    
}
#Preview {
    HomeView()
}
