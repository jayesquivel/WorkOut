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
        List {
            Section {
                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString),
                       UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    HStack {
                        Text("Device Settings")
                            .foregroundColor(.blue)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
            } footer: {
                Text("To manage notification permissions, go to your device settings.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }

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
