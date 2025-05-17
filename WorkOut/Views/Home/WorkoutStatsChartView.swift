//
//  WorkoutStatsChartView.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 5/15/25.
//
import SwiftUI
import Charts
import Foundation

// Creating sample data for display purposes
struct WorkoutStat: Identifiable {
    let id = UUID()
    let date: Date
    let caloriesBurned: Double
}


let sampleStats: [WorkoutStat] = [
    WorkoutStat(date: .now.addingTimeInterval(-86400 * 3), caloriesBurned: 250),
    WorkoutStat(date: .now.addingTimeInterval(-86400 * 2), caloriesBurned: 320),
    WorkoutStat(date: .now.addingTimeInterval(-86400), caloriesBurned: 180),
    WorkoutStat(date: .now, caloriesBurned: 400)
]

// Making a chart view using Charts import
struct WorkoutStatsChartView: View {
    var stats: [WorkoutStat] = sampleStats
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Calories Burned This Week")
                .font(.headline)
                .padding(.bottom, 8)
            
            Chart(stats) {
                LineMark(
                    x: .value("Date", $0.date, unit: .day),
                    y: .value("Calories", $0.caloriesBurned)
                )
                .foregroundStyle(.blue)
            }
            .frame(height: 200)
        }
        .padding()
    }
}
#Preview {
    WorkoutStatsChartView()
}
