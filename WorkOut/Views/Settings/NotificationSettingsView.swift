//
//  NotificationSettingsView.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 6/25/25.
//

import SwiftUI

struct NotificationSettingsView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString),
                       UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    
                    // Start of HStack with Device settings section
                    HStack {
                        Text("Device Settings")
                            .foregroundColor(.blue)
                            .underline()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.secondarySystemGroupedBackground))
                    )
                }
                .padding(.horizontal)
                .padding(.top, 10) // <— controls the gap from the nav bar
                // Footer
                Text("To manage notification permissions, go to your device settings.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                
                    .padding(.top, 8)
            }
        }
        .background(Color(.systemGroupedBackground))
        
        // Notification Settings title/Back button 
        .navigationTitle("Notification Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    NavigationStack{
        NotificationSettingsView()
    }
}
