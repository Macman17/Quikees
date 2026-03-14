//
//  utils.test.swift
//  BookManager
//
//  Created by Naqui Darby on 3/12/26.
//

import Testing
@testable import BookManager

@MainActor @Suite(" Tests Utils")
struct UtilsTests {
    
    
    
    
    @Test("Test filterFavoriteBook function filter favorite book")
    func testFilterFavoriteBook(){
        
        let books: [PersistentBook] = [
            PersistentBook(title: "Book 1"),
            PersistentBook(title: "Book 2", isFavorite: true),
            PersistentBook(title: "Book 3"),
            PersistentBook(title: "Book 4", isFavorite: true, genre: .horror)
        ]
        
        
        let filteredBooks = filterFavoriteBook(books: books, genre: .horror)
        
        
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks.first?.title == "Book 4")
    }
    
    @Test("Test filterFavoriteBook function filter favorite book")
    func testFilterReadingStatus(){
        let books: [PersistentBook] = [
                        PersistentBook(title: "Book 1"),
                        PersistentBook(title: "Book 2", readingStatus: .finshed),
                        PersistentBook(title: "Book 3"),
                        PersistentBook(title: "Book 4",genre: .horror, readingStatus: .finshed)
                    ]
       
        let filteredBooks = filterFavoriteBook(books: books, genre: .horror, readingStatus: .finshed)
        
        #expect(filteredBooks.count == 2)
        #expect(filteredBooks.map(\.title) == ["Book 2", "Book 4"])
    }
}

            

