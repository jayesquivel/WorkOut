//
//  LogSettings.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 9/18/25.
//

import SwiftUI
import FoundationModels

struct RestTimerSettings: View {
    // All settings populate by user default
    @AppStorage("timerIncrement") private var timerIncrement: Int = 10
    @AppStorage("overrideMuteSwitch") private var overrideMuteSwitch: Bool = false
    @AppStorage("soundEffect") private var soundEffect: String = "Boxing Bell"
    @AppStorage("restTimerMode") private var restTimerMode: String = "Inline"
    @AppStorage("workSetTimer") private var workSetTimer: Int = 120 // 2:00 in seconds
    @AppStorage("warmUpSetTimer") private var warmUpSetTimer: Int = 0
    @AppStorage("dropSetTimer") private var dropSetTimer: Int = 0
    
    //
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                // Timer increment
                Section {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Timer Increment")
                            .font(.headline)
                        
                        HStack(spacing: 8){
                            ForEach([5, 10, 30], id: \.self) {
                                increment in Button(action: {
                                    timerIncrement = increment
                                }) {
                                    Text("\(increment)s")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(timerIncrement == increment ? .white: .primary)
                                        .frame(minWidth: 44, minHeight: 32)
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .fill(timerIncrement == increment ? Color.blue: Color(.systemGray5))
                                        )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            Spacer()
                        }
                    }
                    .padding(.vertical, 8)
                }
                
                // Override Mute Switch
                Section {
                    HStack {
                        Text("Override Mute Switch")
                            .font(.headline)
                        Spacer()
                        Toggle("", isOn: $overrideMuteSwitch)
                    }
                }
                
                // Sound Effect
                Section {
                    NavigationLink(destination: SoundEffectPicker(selectedSound: $soundEffect)){
                        HStack {
                            Text("Sound Effect")
                                .font(.headline)
                            Spacer()
                            Text(soundEffect)
                                .foregroundColor(.blue)
                        }
                    }
                }
                
                // Rest Timer Mode
                Section {
                    NavigationLink(destination: RestTimerModePicker(selectedMode: $restTimerMode)) {
                        HStack {
                            Text("Rest Timer Mode")
                                .font(.headline)
                            Spacer()
                            Text(restTimerMode)
                                .foregroundColor(.blue)
                        }
                    }
                }
                
                // Default Timer Values
                Section {
                    Text("DEFAULT TIMER VALUES")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.top)
                    
                    NavigationLink(destination: TimerValuePicker(
                        title: "Work Set",
                        selectedValue: $workSetTimer
                    )) {
                        HStack{
                            Text("Work Set")
                                .font(.headline)
                            Spacer()
                            Text(formatTime(seconds: workSetTimer))
                                .foregroundColor(.primary)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(.systemGray5)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    
                    NavigationLink(destination: TimerValuePicker(
                        title: "Warm-up Set",
                        selectedValue: $warmUpSetTimer
                    )) {
                        HStack {
                            Text("Warm-up Set")
                                .font(.headline)
                            Spacer()
                            Text(warmUpSetTimer == 0 ? "None" : formatTime(seconds: warmUpSetTimer))
                                .foregroundColor(.secondary)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(.systemGray5))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    
                    NavigationLink(destination: TimerValuePicker(
                        Title: "Drop Set",
                        selectedValue: $dropSetTimer
                    )) {
                        HStack {
                            Text("Drop Set")
                                .font(.headline)
                            Spacer()
                            Text(dropSetTimer == 0 ?
                                 "None" : formatTime(seconds: dropSetTimer))
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }
                
                // Update Templates Button
                Section {
                    Button(action: updateRestTimersForAllTemplates){
                        HStack{
                            Spacer()
                            Text("Update Rest Timers for All Templates")
                                .font(.headline)
                                .foregroundColor(.blue)
                            Spacer()
                        }
                        .padding(.vertical, 12)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationTitle("Rest Timer")
            .navigationBarTitleDisplayMode(.inline)
            .toolBar{
                
                ToolbartItem(placement: .navigationBarLeading) {
                    Button("Back"){
                        dismiss()
                    }
                }
            }
            
        }
    }
    
    private func formatTime(seconds: Int) -> String {
        if seconds == 0 {
            return "None"
    }
        let minutes = seconds / 60
        let remaingSeconds = seconds % 60
        return String(format: "%d:%02d", minutes, remainingSeconds)
}
    private func updateRestTimersForAllTemplates() {
        // Implement logic to update all workout templates
        print("Updating rest timers for all templates...")
    }

#Preview {
    RestTimerSettings()
}
