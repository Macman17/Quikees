//
//  DetailView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/12/26.
//

import SwiftUI

struct DetailView: View {
    
    let book: Book
    
    var body: some View {
        VStack{
            HStack{
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120,height: 120 )
                    .padding()
                VStack(alignment: .leading){
                    VStack{
                        Text(book.title)
                            .font(.title.bold())
                        Text("by \(book.author)")
                            .font(.subheadline)
                        
                        
                    }
                }
            }
            HStack{
                Text(book.summary)
            }
            .font(.body)
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.secondary)
            .border(Color(.gray), width: 1)
            
        }
        .padding(.horizontal)
    }
}
