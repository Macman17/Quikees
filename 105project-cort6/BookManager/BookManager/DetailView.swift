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
                    .frame(width: 100,height: 100 )
                    .padding()
                VStack(alignment: .leading){
                    VStack{
                        Text(book.title)
                        Text("by \(book.author)")
                    }
                }
            }
            Text(book.summary)
        }
        .padding(.horizontal)
    }
}
