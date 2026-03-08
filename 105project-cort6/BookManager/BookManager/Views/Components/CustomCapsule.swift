//
//  CustomCapsule.swift
//  BookManager
//
//  Created by Naqui Darby on 2/24/26.
//

import SwiftUI

struct CustomCapsule: View {
    
    var text: String
    var color: Color = .accentColor
    
    
    var body: some View {
        
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(8)
            .background(color.opacity(0.3))
            .clipShape(Capsule())
    }
}

