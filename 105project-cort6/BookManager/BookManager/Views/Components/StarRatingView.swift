//
//  StarRatingView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/19/26.
//

import SwiftUI

    

struct StarRatingView: View {
    var rating: Int
    
    var body: some View {
        HStack(spacing: 2){
            ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= rating ?
                          "star.fill" : "star")
                        .font(.title)
                        .foregroundColor(.yellow)
                }
            }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Rating: \(rating) out of 5")
    }
}

