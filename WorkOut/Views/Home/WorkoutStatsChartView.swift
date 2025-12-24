//
//  WorkoutStatsChartView.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 5/15/25.
//  Updated: 12/24/2025
import SwiftUI
import Charts
import Foundation

// Creating sample data for display purposes
struct WorkoutStat: Identifiable {
    let id = UUID()
    let date: Date
    let caloriesBurned: Double
    let dayLabel: String
    
    init(date: Date, caloriesBurned: Double) {
        self.date = date
        self.caloriesBurned = caloriesBurned
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        self.dayLabel = formatter.string(from: date)
    }
}


// Sample data
let sampleStats: [WorkoutStat] = [
    WorkoutStat(date: .now.addingTimeInterval(-86400 * 6), caloriesBurned: 180),
    WorkoutStat(date: .now.addingTimeInterval(-86400 * 5), caloriesBurned: 250),
    WorkoutStat(date: .now.addingTimeInterval(-86400 * 4), caloriesBurned: 320),
    WorkoutStat(date: .now.addingTimeInterval(-86400 * 3), caloriesBurned: 280),
    WorkoutStat(date: .now.addingTimeInterval(-86400 * 2), caloriesBurned: 180),
    WorkoutStat(date: .now.addingTimeInterval(-86400), caloriesBurned: 350),
    WorkoutStat(date: .now, caloriesBurned: 400)
]

// Making a chart view using Charts import
struct WorkoutStatsChartView: View {
    var stats: [WorkoutStat] = sampleStats
    
    private var totalCalories: Double {
        stats.reduce(0) {$0 + $1.caloriesBurned}
    }
    
    private var averageCalories: Double {
        guard !stats.isEmpty else { return 0}
        return totalCalories / Double(stats.count)
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            // Header with stats
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Label ("Calories Burned", systemImage: "flame.fill")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.orange)
                    
                    Spacer()
                    
                    Text("This Week")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                HStack(alignment: .firstTextBaseline, spacing: 4){
                    Text("\(Int(totalCalories))")
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                    Text("kcal total")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            
            // Char
            Chart(stats){ stat in
                BarMark(x: .value("Day", stat.dayLabel),
                        y: .value("Calories", stat.caloriesBurned)
                )
                .foregroundStyle(
                    LinearGradient(
                        colors: [.orange, .orange.opacity(0.7)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .cornerRadius(4)
                
                // Average line
                RuleMark(y: .value("Average", averageCalories))
                    .foregroundStyle(.secondary.opacity(0.5))
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5, 3]))
                    .annotation(position: .top, alignment: .trailing){
                        Text("Avg: \(Int(averageCalories))")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
            }
            
            .chartYAxis {
                AxisMarks(position: .leading) { value in
                    AxisGridLine()
                        .foregroundStyle(.secondary.opacity(0.2))
                    AxisValueLabel()
                        .foregroundStyle(.secondary)
                }
            }
            
            .chartXAxis{
                AxisMarks { value in
                    AxisValueLabel()
                        .foregroundStyle(.secondary)
                }
            }
            .frame(height: 160)
        }
    }
}

#Preview {
    WorkoutStatsChartView()
        .padding()
        .background(.regularMaterial)
        .cornerRadius(12)
        .padding()
}
