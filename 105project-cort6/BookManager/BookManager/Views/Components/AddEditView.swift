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
    
    @State private var title : String
    @State private var author : String
    @State private var summary : String
    @State private var rating: Int
    @State private var review : String
    @State private var genre: Genre
    @State private var readingStatus: ReadingStatus
    @State private var isFavorite: Bool
    @State private var coverData: Data?
    
    
    
    init(book: PersistentBook? = nil){
        self.book = book
        if let book{
            print(book)
            title = book.title
            author = book.author
            summary = book.summary
            rating = book.rating
            review = book.review
            genre = book.genre
            readingStatus = book.readingStatus
            isFavorite = book.isFavorite
            coverData = book.coverData
            
            
        } else {
            title = ""
            author = ""
            summary = ""
            rating = 0
            review = ""
            genre = .unknown
            readingStatus = .unknown
            isFavorite = false
           
        }
    }
        
        var body: some View {
            NavigationStack{
                var _ = print(title)
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
                        Section(header: Text("Book details")){
                            ImageField(data: $coverData)
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
                    }
                }
                        
                        .navigationTitle("\(book == nil ? "Add" : "Edit") Book")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction){
                                Button("Cancel"){
                                    dismiss()
                                }
                            }
                            ToolbarItem(placement: .primaryAction){
                                FavoriteToggle(isFavorite: $isFavorite)
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Save") {
                                    let isNewBook = book == nil
                                    let bookToSave = book ?? PersistentBook(title: title)
                                    bookToSave.title = title
                                    bookToSave.author = author
                                    bookToSave.summary = summary
                                    bookToSave.rating = rating
                                    bookToSave.review = review
                                    bookToSave.genre = genre
                                    bookToSave.isFavorite = isFavorite
                                    bookToSave.readingStatus = readingStatus
                                    if (coverData != nil){
                                        bookToSave.coverData = coverData!
                                    }
                                    print(bookToSave)
                                        if isNewBook {
                                            modelContext.insert(bookToSave)
                                        }
                                        do {
                                            try modelContext.save()
                                            
                                        } catch {
                                            print("Failed to save the book: \(error)")
                                        }
                                            dismiss()
                                    }.disabled(title.isEmpty)
                            }
                            
                        }
                    }
                    
                }
            }
        
    

