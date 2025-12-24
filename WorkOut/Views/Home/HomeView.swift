//
//  HomeView.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 5/13/25.
//  Redesigned to match Apple Health Summary page style
//

import SwiftUI
import Foundation

struct HomeView: View {
    @State private var showingProfile = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: - Pinned Section
                    SectionHeaderView(title: "Pinned", actionTitle: "Edit") {
                        // Edit action - customize pinned cards
                    }
                    
                    // MARK: - Health-Style Cards
                    VStack(spacing: 12) {
                        // Calories Card
                        HealthCardView(
                            icon: "flame.fill",
                            title: "Calories",
                            accentColor: .orange,
                            timestamp: "Today"
                        ) {
                            HStack {
                                Text("1,250")
                                    .font(.system(size: 34, weight: .regular, design: .rounded))
                                Text("kcal")
                                    .font(.title3)
                                    .foregroundStyle(.secondary)
                                Spacer()
                                // Mini bar visualization
                                MiniBarChart(values: [0.4, 0.6, 0.8, 1.0], color: .orange)
                            }
                        }
                        
                        // Workouts Card
                        HealthCardView(
                            icon: "figure.run",
                            title: "Workouts",
                            accentColor: .green,
                            timestamp: "9:23 AM"
                        ) {
                            HStack {
                                HStack(alignment: .firstTextBaseline, spacing: 2) {
                                    Text("51")
                                        .font(.system(size: 34, weight: .regular, design: .rounded))
                                    Text("min")
                                        .font(.title3)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                MiniBarChart(values: [0.3, 0.5, 0.7, 0.9], color: .green)
                            }
                        }
                        
                        // Steps Card
                        HealthCardView(
                            icon: "figure.walk",
                            title: "Steps",
                            accentColor: .cyan,
                            timestamp: "Today"
                        ) {
                            HStack {
                                HStack(alignment: .firstTextBaseline, spacing: 2) {
                                    Text("8,432")
                                        .font(.system(size: 34, weight: .regular, design: .rounded))
                                    Text("steps")
                                        .font(.title3)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                MiniBarChart(values: [0.5, 0.7, 0.4, 0.85], color: .cyan)
                            }
                        }
                        
                        // Heart Rate Card
                        HealthCardView(
                            icon: "heart.fill",
                            title: "Heart Rate",
                            accentColor: .red,
                            timestamp: "2 hrs ago"
                        ) {
                            HStack {
                                HStack(alignment: .firstTextBaseline, spacing: 2) {
                                    Text("72")
                                        .font(.system(size: 34, weight: .regular, design: .rounded))
                                    Text("BPM")
                                        .font(.title3)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                // Heart rate mini chart
                                MiniLineChart(color: .red)
                            }
                        }
                        
                        // Sleep Card
                        HealthCardView(
                            icon: "bed.double.fill",
                            title: "Sleep",
                            accentColor: .purple,
                            timestamp: "Today"
                        ) {
                            HStack {
                                HStack(alignment: .firstTextBaseline, spacing: 2) {
                                    Text("7")
                                        .font(.system(size: 34, weight: .regular, design: .rounded))
                                    Text("hr")
                                        .font(.title3)
                                        .foregroundStyle(.secondary)
                                    Text("23")
                                        .font(.system(size: 34, weight: .regular, design: .rounded))
                                    Text("min")
                                        .font(.title3)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                SleepScoreView(score: 84)
                            }
                        }
                    }
                    
                    // MARK: - Weekly Stats Section
                    SectionHeaderView(title: "This Week", actionTitle: "See All") {
                        // Navigate to detailed stats
                    }
                    
                    WorkoutStatsChartView()
                        .padding()
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Summary")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ProfileButtonView {
                        showingProfile = true
                    }
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileView()
            }
        }
    }
}

// MARK: - Profile Button View
/// A circular profile button matching Apple Health's style
struct ProfileButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            // Haptic feedback
            let impactFeedback = UIImpactFeedbackGenerator(style: .light)
            impactFeedback.impactOccurred()
            action()
        }) {
            Image(systemName: "person.crop.circle.fill")
                .font(.title2)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.blue)
        }
        .accessibilityLabel("Profile")
        .accessibilityHint("Opens your profile settings")
    }
}

// MARK: - Section Header View
/// Reusable section header with title and action button
struct SectionHeaderView: View {
    let title: String
    let actionTitle: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
            Button(actionTitle) {
                action()
            }
            .font(.body)
        }
        .padding(.top, 8)
    }
}

// MARK: - Health Card View
/// Generic card component matching Apple Health's card style
struct HealthCardView<Content: View>: View {
    let icon: String
    let title: String
    let accentColor: Color
    let timestamp: String
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header row
            HStack {
                Label(title, systemImage: icon)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(accentColor)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Text(timestamp)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.tertiary)
                }
            }
            
            // Content area
            content
        }
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - Mini Bar Chart
/// Small bar visualization for cards
struct MiniBarChart: View {
    let values: [Double]
    let color: Color
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 3) {
            ForEach(Array(values.enumerated()), id: \.offset) { index, value in
                RoundedRectangle(cornerRadius: 2)
                    .fill(index == values.count - 1 ? color : color.opacity(0.4))
                    .frame(width: 8, height: CGFloat(value) * 40)
            }
        }
        .frame(height: 40)
    }
}

// MARK: - Mini Line Chart
/// Small line visualization for heart rate style cards
struct MiniLineChart: View {
    let color: Color
    
    var body: some View {
        // Simple wave pattern
        Image(systemName: "waveform.path.ecg")
            .font(.title)
            .foregroundStyle(color)
    }
}

// MARK: - Sleep Score View
/// Circular progress indicator for sleep score
struct SleepScoreView: View {
    let score: Int
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.purple.opacity(0.3), lineWidth: 4)
                .frame(width: 44, height: 44)
            
            Circle()
                .trim(from: 0, to: CGFloat(score) / 100)
                .stroke(
                    AngularGradient(
                        colors: [.red, .orange, .green, .cyan],
                        center: .center
                    ),
                    style: StrokeStyle(lineWidth: 4, lineCap: .round)
                )
                .frame(width: 44, height: 44)
                .rotationEffect(.degrees(-90))
            
            Text("\(score)")
                .font(.caption)
                .fontWeight(.semibold)
        }
    }
}

// MARK: - Placeholder Profile View
struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 16) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.blue)
                        
                        VStack(alignment: .leading) {
                            Text("Your Name")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("View Health Details")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }
                
                Section("Health Details") {
                    LabeledContent("Date of Birth", value: "Not Set")
                    LabeledContent("Height", value: "Not Set")
                    LabeledContent("Weight", value: "Not Set")
                }
                
                Section("Features") {
                    NavigationLink("Health Checklist") {
                        Text("Health Checklist")
                    }
                    NavigationLink("Notifications") {
                        Text("Notifications")
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
