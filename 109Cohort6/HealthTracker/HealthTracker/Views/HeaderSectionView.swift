//
//  HeaderSectionView.swift
//  HealthTracker
//
//  Created by Naqui Darby on 4/25/26.
//


import SwiftUI

struct HeaderSectionView: View {
    var body: some View {
        VStack(spacing:10){
            Image(systemName: "figure.walk")
                .font(.system(size: 80))
                .foregroundColor(Color.blue)
            
            Text("Daily Activity Tracker")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Monitor Health Data")
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
        .padding()
    }
}


#Preview {
    HeaderSectionView()
}
