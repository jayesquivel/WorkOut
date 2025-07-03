//
//  AppleHealthSettings.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 7/2/25.
//

import SwiftUI

struct AppleHealthSettings: View {
    
    // Adding static placeholders
    @State private var writeWorkouts = false
    @State private var writeMeasurements = false
    @State private var readMeasurements = false
    @State private var showWriteWaring = false
    @State private var showReadWarning = false
    
    //Start of view
    var body: some View {
        Form {
            
            // General Disclaimer
            Section {
                Text("Apple Health integration requires permissions to be granted in Settings -> Data Access & Devices -> WorkOut")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            // Toggle/Allow button for WorkOut to Write data over Apple Health
            Section(header: Text("ALLOW WORKOUT TO WRITE HEALTH DATA")) {
                Toggle("Workouts", isOn: $writeWorkouts)
                Text("Sync workouts originating from WorkOut to Apple Health.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Toggle("Measurements", isOn: $writeMeasurements)
                Text("Sync measurements originating from WorkOut to Apple Health.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                // showWriteWarning
                if showWriteWaring {
                    BannerView(
                        text: "2 measurements without corresponding Apple Health entries. Add measurements to Apple Health?",
                        buttonTitle: "Add",
                        action: { print("Add tapped")}
                    )
                }
            }
            
        
        }
    }
}
struct BannerView: View {
    var text: String
    var buttonTitle: String
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(text)
                .foregroundColor(.black)
                .font(.footnote)
            Button(buttonTitle, action: action)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.accentColor)
                .cornerRadius(8)
        }
        .padding()
        .background(Color.yellow.opacity(0.4))
        .cornerRadius(8)
    }
}
#Preview {
    AppleHealthSettings()
}
