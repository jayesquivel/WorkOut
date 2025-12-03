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
}

struct LanguageSettings: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LanguageSettings()
}
