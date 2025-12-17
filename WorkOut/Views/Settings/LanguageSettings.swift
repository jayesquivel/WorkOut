//
//  LanguageSettings.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 12/3/25.
//

import SwiftUI

// Language Model
struct Language: Identifiable, Equatable{
    let id = UUID()
    let code: String
    let name: String
    let nativeName: String
    let flag: String
}

// Language Manager
class LanguageManager:ObservableObject{
    @Published var currentLanguage: String{
        didSet{
            UserDefaults.standard.set(currentLanguage, forKey: "appLanguage")
        }
    }
    
    let avaliableLanguages = [
        Language(code: "EN", name: "English", nativeName: "English", flag: "🇺🇸"),
        Language(code: "ES", name: "Spanish", nativeName: "Espanol", flag: "🇲🇽"),
        Language(code: "FR", name: "French", nativeName: "Français", flag: "🇫🇷"),
        Language(code: "DE", name: "German", nativeName: "Deutsh", flag: "🇩🇪"),
        Language(code: "PT", name: "Portuguese", nativeName: "Português", flag: "🇧🇷")
    ]
    
    init(){
        self.currentLanguage = UserDefaults.standard.string(forKey: "appLanguage") ?? "EN"
    }
    
    func setLanguage(_ code: String) {
        currentLanguage = code
        // In app , trigger localization updates
        NotificationCenter.default.post(name: NSNotification.Name("LanguageChange"), object: nil)
    }
    
    func getCurrentLanguage() -> Language? {
        avaliableLanguages.first {$0.code == currentLanguage}
    }
}

// Langugage Settings View

struct LanguageSettings: View {
    @StateObject private var languageManager = LanguageManager()
    @Environment(\.dismiss) private var dimiss
    @Namespace private var animation
    
    var body: some View {
        List {
            Section {
                ForEach(languageManager.avaliableLanguages) { language in
                    LanguageRow(
                        language: language,
                        isSelected: languageManager.currentLanguage == language.code,
                        animation: animation
                    )
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            languageManager.setLanguage(language.code)
                        }
                        // Haptic feedback implementation
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.impactOccurred()
                    }
                }
            } header: {
                Text("App Language")
            } footer: {
                Text("Choose your preferred language for your app! This setting only affects the app interface and doesn't affect your device system settings.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            // Additional section showing current selection
            Section {
                HStack {
                    Text("Current language")
                        .foregroundStyle(.secondary)
                    Spacer()
                    if let current = languageManager.getCurrentLanguage() {
                        Text("\(current.flag) \(current.nativeName)")
                            .fontWeight(.medium)
                    }
                }
            }
        }
        .navigationTitle("Language")
        .navigationBarTitleDisplayMode(.large)
    }
}


// Language row component
struct LanguageRow: View {
    let language: Language
    let isSelected: Bool
    let animation: Namespace.ID

    var body: some View {
        HStack(spacing: 16) {
            // Flag emoji
            Text(language.flag)
                .font(.system(size: 32))

            // Language names
            VStack(alignment: .leading, spacing: 4) {
                Text(language.nativeName)
                    .font(.body)
                    .fontWeight(isSelected ? .semibold : .regular)

                Text(language.name)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            // Checkmark with animation
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundStyle(.blue)
                    .matchedGeometryEffect(id: "checkmark", in: animation)
            }
        }
    }
}

#Preview {
    LanguageSettings()
}
