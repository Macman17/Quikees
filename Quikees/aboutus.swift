//
//  aboutus.swift
//  Quikees
//
//  Created by Naqui Darby on 1/6/26.
//

import SwiftUI

struct aboutus: View {
    var body: some View {
        VStack {
            
            Image(.spencerDavisRJ6KjC68E4Unsplash)
                .frame(width: 400, height: 400, alignment: .center)
                .clipShape(Rectangle()).frame(width: 200, height: 200)
                .padding(.bottom, 100)
            Text("About Us")
                .font(.title2)
                .padding()
            Text("Quikees is a family resturant in the heart of the city. We serve up delicious food and a great selection of drinks. We hope to see you soon!")
        }
        .padding()
    }
}

#Preview {
    aboutus()
}
