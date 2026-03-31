//
//  ListView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/24/26.
//

import SwiftUI
import SwiftData

struct ListView: View {
    
    @Environment(\.modelContext) private var modelContext
        @Query var books: [PersistentBook]
       @State private var showAddSheet = false
 //      @State private var newBook = getNewBook()
    
    var body: some View {
        NavigationStack{
            List(books, id:\.self.id){ book in
                NavigationLink(destination: DetailView(book: book)){
                    ListViewItemView(book: book)
                }
            }
            .navigationTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add", action:{
                showAddSheet.toggle()
            }))
            .sheet(isPresented: $showAddSheet){
                // onDismiss
  //              if(!newBook.title.isEmpty){
//                  books.append(newBook)
//                }
//                newBook = getNewBook()
            }content:{
                AddEditView(modelContext: modelContext)
            }
        }
    }
}

