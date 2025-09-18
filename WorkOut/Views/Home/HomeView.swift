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
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))

                    Text("Workout Cards go here")
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
                }
                .scenePadding()
            }
            .navigationTitle("Dashboard")
            .navigationSubtitle("Your fitness journey")
            .toolbar{
                ToolbarItem(placement: .principal){
                    VStack {
                        Text("Dashboard")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Your fitness journey")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
    
}
#Preview {
    HomeView()
}
