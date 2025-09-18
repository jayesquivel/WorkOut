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
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
}

#Preview {
    
}
