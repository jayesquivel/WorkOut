//
//  WorkoutCardView.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 5/15/25.
//

import Foundation
import SwiftUI

// Mark: - Workout type Enum
enum WorkoutType: String, CaseIterable {
    case running = "Running"
    case walking = "Walking"
    case cycling = "Cycling"
    case swimming = "Swimming"
    case strength = "Strength Training"
    case yoga = "Yoga"
    case hiit = "HIIT"
    case other = "Other"
    
    var icon: String {
        switch self {
        case .running: return "figure.run"
        case .walking: return "figure.walk"
        case .cycling: return "figure.outdoor.cycle"
        case .swimming: return "figure.pool.swim"
        case .strength: return "dumbbell.fill"
        case .yoga: return "figure.mind.and.body"
        case .hiit: return "flame.fill"
        case .other: return "figure.mixed.cardio"
        }
    }
    
    var color: Color {
        switch self {
        case .running: return .green
        case .walking: return .cyan
        case .cycling: return .orange
        case .swimming: return .blue
        case .strength: return .purple
        case .yoga: return .indigo
        case .hiit: return .red
        case .other: return .gray
        }
    }
}

// Workout Data Model
struct Workout: Identifiable {
    let id = UUID()
    let type: WorkoutType
    let duration: TimeInterval // in seconds
    let calories: Int
    let date: Date
    
    var formattedDuration: String  {
        let minutes = Int(duration) / 60
        let hours = minutes / 60
        let remainingMinutes = minutes % 60
        
        if hours > 0 {
            return "\(hours)h \(remainingMinutes)m"
        } else {
            return "\(minutes) min"
        }
    }
    
    var formattedDistance: String? {
        guard let distance = distance else { return nil }
        let km = distance / 1000
        return String(format: "%.2f km", km)
    }
    
    var formatteTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

// Workout Card View
struct WorkoutCardView: View {
    let workout: Workout
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            // Header
            Hstack {
                Label(workout.type.rawValue, systemImage: workout.type.icon)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(workout.type.color)
                
            Spacer()
                
                HStack(spacing: 4){
                    Text(workout.formattedTime)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.tertiary)
                }
            }
            
            // Main stats
            HStack {
                // Duration
                HStack(alignment: .firstTextBaseline, spacing: 2){
                    Text(workout.formattedDuration)
                        .font(.system(size: 28, weight: .regular, design: .rounded))
                }
                
                Spacer()
                
                // Secondary Stats
                VStack(alignment: .trailing, spacing: 4){
                    HStack(spacing: 4) {
                        Image(systemName: "flame.fill")
                            .foregroundStyle(.orange)
                        Text("\(workout.calories) kcal")
                            .foregroundStyle(.secondary)
                    }
                    .font(.caption)
                    
                    if let distance = workout.formattedDistance {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.left.arrow.right")
                                .foregroundStyle(workout.type.color)
                            Text(distance)
                                .foregroundStyle(.secondary)
                        }
                        .font(.caption)
                    }
                }
            }
        }
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

// Recent Workout list
struct RecentWorkoutView: View {
    let workouts: [Workout]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            ForEach(workouts) { workout in WorkoutCardView(workout: workout)
            }
        }
    }
}

// Placeholder data
extension Workout {
    static let sampleWorkouts: [Workout] = [
        Workout(type: .running, duration: 1800, calories: 320, date: Date(), distance: 4200),
        Workout(type: .strength, duration: 2700, calories: 280, date: Date().addingTimeInterval(-86400), distance: nil),
        Workout(type: .cycling, duration: 3600, calories: 400, date: Date().addingTimeInterval(-172800), distance: 12000)
    ]
}

#Preview {
    ScrollView {
        VStack(spacing: 12) {
            ForEach(Workout.sampleWorkouts) { workout in WorkoutCardView(workout: workout)}
        }
    }
    .padding()
    .background(Color(.systemBackground))
}

