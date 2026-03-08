//
//  SquareCardView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/24/26.
//

import SwiftUI

struct SquareCardView: View {
    
    var book: PersistentBook
    
    var body: some View {
        ZStack{
            
            VStack{
                Text(book.title)
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .background(LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.8)]), startPoint: .bottom, endPoint: .top))
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding()
                    
                Spacer()
                Text(book.author)
                    .frame(maxWidth: .infinity)
                    .font(.subheadline)
                    .background(LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .padding()
                    
            }
        }.frame(width: .infinity, height: .infinity)
            
            .background(
                Image(uiImage: book.cover)
                                .resizable()
                                .scaledToFill()
            )
            
            .cornerRadius(12)
            .aspectRatio(1, contentMode: .fit)
       
    }
}


