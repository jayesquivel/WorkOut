//
//  WelcomeBanner.swift
//  WorkOut
//
//  Created by Joseph Esquivel on 5/15/25.
//

import Foundation
import SwiftUI

struct WelcomeBanner: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Your day,")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("starts here")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemGray6))
        )
        .padding(.horizontal)
    }
}

#Preview {
    
}
