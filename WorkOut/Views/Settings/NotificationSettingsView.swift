//
//  NotificationSettingsView.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 6/25/25.
//

import SwiftUI

struct NotificationSettingsView: View {
    var body: some View {
        Form {
            Section{
                Button {
                    if let url = URL (string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    HStack {
                        Text("Device Settings")
                            .foregroundColor(.black)
                            .underline()
                        Spacer()
                        Image(systemName: "chevron.right") .foregroundColor(.gray)
                    }
                }
            } footer: {
                Text("To manage notification permissions, go to your device settings.")
            }
        }
    }
}

#Preview {
    NotificationSettingsView()
}
