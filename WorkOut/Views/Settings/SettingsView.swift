//
//  SettingsView.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 5/13/25.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                // General Section
                Section(header: Text("General")) {
                    NavigationLink("Notifications", destination: NotificationSettingsView())
                    NavigationLink("Apple Health", destination: AppleHealthSettings())
                    NavigationLink("Siri Shortcuts", destination: Text("Siri Shortcuts"))
                    NavigationLink("Advanced", destination: Text("Advanced Settings"))
                }
                
                // Apearance Section
                Section(header: Text("Appearance")) {
                    NavigationLink("Theme", destination: Text("Theme Settings"))
                    NavigationLink("App Icons", destination: Text("App Icons Settings"))
                }
                
                // Log WorkOut! Section
                Section(header: Text("Log WorkOut!")) {
                    NavigationLink("Rest Timer", destination: Text("Rest Timer Settings"))
                    NavigationLink("Warm-Up Calculator", destination: Text("Warm-Up Calculator Settings"))
                    NavigationLink("Previous Set", destination: Text("Previous Set Settings"))
                }
                
                // Units and Localization Section
                Section(header: Text("Units and Localization")) {
                    NavigationLink("Language", destination: Text("Language Settings"))
                    NavigationLink("Measurement Weight Unit", destination: Text("Weight Unit Settings"))
                    NavigationLink("Distance Unit", destination: Text("Distance Unit Settings"))
                    NavigationLink("Size Unit", destination: Text("Size Unit Settings"))
                    NavigationLink("Start Week On", destination: Text("Start Week On Settings"))
                }
                
                // Data Management Section
                Section(header: Text("Data Management")) {
                    NavigationLink("Sync", destination: Text("Sync Settings"))
                    NavigationLink("Export Data", destination: Text("Export Data Settings"))
                }
                
                // Help and Support Section
                Section(header: Text("Help and Support")) {
                    NavigationLink("Help & Support", destination: Text("Help & Support"))
                    NavigationLink("Review in the App Store", destination: Text("Review"))
                    NavigationLink("Privacy Policy", destination: Text("Privacy Policy"))
                    NavigationLink("Terms of Service", destination: Text("Terms of Service"))
                    NavigationLink("Privacy Settings", destination: Text("Privacy Settings"))
                }
            }
            // Title
            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    } 
}
#Preview {
    SettingsView()
}
