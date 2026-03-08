//
//  AddEditView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/17/26.
//

import SwiftUI
import SwiftData


struct AddEditView: View {
    
    var book: PersistentBook?
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var title = ""
    @State private var author = ""
    @State private var summary = ""
    @State private var rating: Int = 0
    @State private var review = ""
    @State private var genre: Genre = .unknown
    @State private var isRead: Bool = false
    @State private var readingStatus: ReadingStatus = .unknown
    @State private var isFavorite: Bool = false
    
    
    init(book: PersistentBook? = nil){
        self.book = book
        if let book{
            
            self.title = book.title
            self.author = book.author
            self.summary = book.summary
            self.rating = book.rating
            self.review = book.review
            self.genre = book.genre
            self.readingStatus = book.readingStatus
            self.isFavorite = book.isFavorite
            
        }
        
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Book details")){
                    TextField("Book Title", text: $title)
                    TextField("Author", text: $author)
                    TextField("Book Summary", text: $summary)
                        .multilineTextAlignment(.leading)
                    Picker("Genre", selection: $genre){
                        ForEach(Genre.allCases, id: \.self){ genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                    Picker("Reading Status", selection: $readingStatus){
                        ForEach(ReadingStatus.allCases, id: \.self){
                            readingstatus in
                            Text(readingstatus.rawValue).tag(readingstatus)
                        }
                    }
                    
                    
                    Section(header: Text("Book Review")){
                      
                        StarRatingFieldView(rating: $rating)
                        TextEditor(text: $review)
                            .frame(height: 150)
                        
                        
                        TextField("Review", text: $review)
                        
                            .multilineTextAlignment(.leading)
                        
                    }
                }
                
                .navigationTitle("\(book == nil ? "Add" : "Edit") Book")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction){
                        FavoriteToggle(isFavorite: $isFavorite)
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            let isNewBook = book == nil
                            let bookToSave = book ?? PersistentBook(title: "", author: "", summary: "", rating: 1, review: "", isFavorite: false, genre: .unknown, readingStatus: .unknown)
                            bookToSave.title = title
                            bookToSave.author = author
                            bookToSave.summary = summary
                            bookToSave.rating = rating
                            bookToSave.review = review
                            bookToSave.genre = genre
                            bookToSave.isFavorite = isFavorite
                            bookToSave.readingStatus = readingStatus
                        
                            
                            withAnimation(.easeInOut) {
                                if isNewBook {
                                    modelContext.insert(bookToSave)
                                } else {
                                    
                                }
                            }
                            dismiss()
                        }.disabled(title.isEmpty)
                        
                            .foregroundStyle(.blue)
                        
                        
                        
                    }
                    
                }
            }
            
        }
    }
}
