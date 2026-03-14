//
//  PersistentBook.test.swift
//  BookManager
//
//  Created by Naqui Darby on 3/10/26.
//

import Testing
@testable import BookManager
import Foundation

@MainActor @Suite("PersistentBook")
struct PersistentBookTests {
    
    @Test("PersistentBook Initalzation")
    func persistentBookInit() {
        let title = "Test Book"
        let author = "Test Author"
        
        let book = PersistentBook(title: title)
        
        #expect(book.title == title)
        #expect(book.author != "")
        #expect(book.isFavorite == false)
        #expect(book.readingStatus == .unknown)
        #expect(book.rating == 0)
        #expect(book.coverData == nil)
        #expect(book.review == "")
        #expect(book.summary == "")
        #expect(book.genre == .unknown)
        
    }
    
    @Test("PersistentBook initialization with all data set")
    func persistentBookInitAllData() {
        let title = "Test Book"
        let author = "Test Author"
        let isFavorite: Bool = true
        let readingStatus: ReadingStatus = .reading
        let rating: Int = 4
        let coverData: Data? = Data((0..<1024).description.utf8)
        let review: String = "A great read!"
        let summary: String = "This is a test summary."
        let genre: Genre = .fantasy
        
        let book = PersistentBook(
            title: title,
            author: author,
            summary: summary,
            rating: rating,
            review: review,
            isFavorite: isFavorite,
            genre: genre,
            readingStatus: readingStatus,
            coverData: coverData
            
            
            
        
        )
        
        #expect(book.title == title)
        #expect(book.author == author)
        #expect(book.isFavorite == isFavorite)
        #expect(book.readingStatus == readingStatus)
        #expect(book.rating == rating)
        #expect(book.coverData == coverData)
        #expect(book.review == review)
        #expect(book.summary == summary)
        #expect(book.genre == genre)
    }
}
