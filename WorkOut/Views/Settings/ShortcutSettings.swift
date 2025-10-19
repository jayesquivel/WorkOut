
// ShortcutSettings.veiw
//  WorkOut
//
//  Created by Joseph Esquivel on 9/13/25.
//

import SwiftUI

struct ShortcutSettings: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        List {
            Section {
                Button {
                    if let url = URL(string: "shortcuts://"),
                       UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    HStack {
                        Text("Open Shortcuts App")
                            .foregroundColor(.blue)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
            } footer: {
                Text("To manage your shortcuts, open the Shortcuts app on your iPhone.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }

        // Header
        .navigationTitle("Shortcut Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    NavigationStack{
        ShortcutSettings()
    }
}
