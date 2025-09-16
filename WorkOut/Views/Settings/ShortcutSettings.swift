
// ShortcutSettings.veiw
//  WorkOut
//
//  Created by Joseph Esquivel on 9/13/25.
//

import SwiftUI

struct ShortcutSettings: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Button {
                    if let url = URL(string: "shortcuts://"),
                       UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    
                    // Styling for button
                    HStack {
                        Text("Open Shourtcuts App")
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
                Text("To manage your shortcuts, open the Shortcuts app on your iPhone.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                
                    .padding(.top, 8)
            }
        }
        .background(Color(.systemGroupedBackground))
        
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
