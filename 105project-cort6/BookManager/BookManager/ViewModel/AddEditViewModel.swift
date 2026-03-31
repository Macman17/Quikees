//
//  AddEditViewModel.swift
//  BookManager
//
//  Created by Naqui Darby on 3/21/26.
//
import SwiftUI
import SwiftData
internal import Combine

@MainActor
class AddEditViewModel: ObservableObject {
    
    private var book: PersistentBook?
    private var modelContext: ModelContext
    
    @Published  var title : String
    @Published  var author : String
    @Published  var summary : String
    @Published  var rating: Int
    @Published  var review : String
    @Published  var genre: Genre
    @Published  var readingStatus: ReadingStatus
    @Published  var isFavorite: Bool
    @Published  var coverData: Data?
    
    var navigationTitle: String {
        book == nil ? "Add Book" : "Edit Book"
    }
    
    var isNotSavable: Bool {
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        || title == book?.title
        && author == book?.author
        && summary == book?.summary
        && rating == book?.rating
        && review == book?.review
        && genre == book?.genre
        && readingStatus == book?.readingStatus
        && isFavorite == book?.isFavorite
        && coverData == book?.coverData
    }
    init(book: PersistentBook? = nil, modelContext: ModelContext) {
        self.book = book
        self.modelContext = modelContext
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
    
    func saveBook() {
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
    }
}
