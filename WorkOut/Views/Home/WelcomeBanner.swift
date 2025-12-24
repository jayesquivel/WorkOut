//
//  WelcomeBanner.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 5/15/25.
//

import Foundation
import SwiftUI

struct WelcomeBanner: View {
    
    private var greeting: String{
        let hour = Calendar.current.component(.hour, from: <#T##Date#>())
        switch hour {
        case 5..<12:
            return "Good morning"
        case 12..<17:
            return "Good afternoon"
        case 17..<21:
            return "Good evening"
        default:
            return "Good night"
        }
    }
    
    var body: some View{
        VStack(alignment: .leading, spacing: 4) {
            Text(greeting)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            
            Text("Ready to WorkOut!?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 16 ))
    }
}

#Preview {
    WelcomeBanner()
        .padding()
}
