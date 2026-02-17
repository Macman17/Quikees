//
//  ContentView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/12/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let books: [Book] = [
        Book(title: "Walking tall", author: "R. J. Bicken", cover: "lotr_fellowship", summary: "This is a summary"), Book(title: "Tee Top", author: "R John", cover: "lotr_towers", summary: "This is a summary" ), Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", cover: "lotr_king",summary: "This is a summary")
    ]
    
    var body: some View {
        NavigationStack {
            List(books, id:\.self.id){
                book in
                NavigationLink(destination: DetailView(book: book)){
                    HStack{
                        Image(book.cover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .padding()
                        VStack(alignment: .leading){
                            Text(book.title)
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(book.author)
                                .foregroundColor(.secondary)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
            .navigationTitle("Book Manager")
            
        }
        
    }
}

#Preview {
    ContentView()
        
}
