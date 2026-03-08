//
//  StarRatingFieldView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/19/26.
//

import SwiftUI

struct StarRatingFieldView: View {
    
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { rating in
                Button(action: {
                    self.rating = rating
                }) {
                    Image(systemName: rating <= self.rating ? "star.fill" : "star")
                        .font(.title)
                        .foregroundColor(.yellow)
                }.buttonStyle(.plain)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityValue("\(rating)")
        .accessibilityLabel("Rating:")
        .accessibilityAdjustableAction { direction in
            switch direction {
                case .increment:
                    rating = min (rating + 1, 5)
            case .decrement:
                rating = max (rating - 1, 0)
            default:
                break
            }
            
        }
    }
}

