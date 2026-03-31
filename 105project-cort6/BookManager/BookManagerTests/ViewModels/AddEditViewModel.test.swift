//
//  AddEditViewModel.test.swift
//  BookManager
//
//  Created by Naqui Darby on 3/21/26.
//

import Testing
@testable import BookManager
import SwiftData

@MainActor
struct AddEditViewModel_test {
    @Test("Test init when creating a new book")
    func testNewBookInit(){
        
        let container = try ModelContext(
            for: PersistentBook.self,
            configuration: .init(isStoredInMemoryOnly: true)
        )
        
        let modelContext = container.container.mainContext
        let Book = PersistentBook(
            title: "Test Title",
            author: "Author",
            genre: .unknown,
            summary: "Summary",
            isFavorite: false,
            rating: 0,
            readingStatus: .unknown,
            review: "Review",
            coverData: nil
            
        )
        
        let viewModel = AddEditViewModel(
            modelContext: modelContext)
        
        #expect(viewModel.title == "Test Title")
        #expect(viewModel.author == "Author")
        #expect(viewModel.genre == .unknown)
        #expect(viewModel.summary == "Summary")
        #expect(viewModel.isFavorite == false)
        #expect(viewModel.rating == 0)
        #expect(viewModel.readingStatus == .unknown)
        #expect(viewModel.review == "Review")
        #expect(viewModel.coverData == nil)
        #expect(viewModel.saveBook.isEnabled)
        
        
    }
    
    @Test("Test init when editing an exisiting book")
    func testInitWithExistingBook() {
        let container = try ModelContext(
            for: PersistentBook.self,
            configuration: .init(isStoredInMemoryOnly: true)
        )
        
        let modelContext = container.container.mainContext
        let Book = PersistentBook(
            title: "Test Title",
            author: "Author",
            genre: .unknown,
            summary: "Summary",
            isFavorite: false,
            rating: 0,
            readingStatus: .unknown,
            review: "Review",
            coverData: nil
            
        )
        
        let viewModel = AddEditViewModel(
            modelContext: modelContext)
        
        #expect(viewModel.title == "Test Title")
        #expect(viewModel.author == "Author")
        #expect(viewModel.genre == .unknown)
        #expect(viewModel.summary == "Summary")
        #expect(viewModel.isFavorite == false)
        #expect(viewModel.rating == 0)
        #expect(viewModel.readingStatus == .unknown)
        #expect(viewModel.review == "Review")
        #expect(viewModel.coverData == nil)
        #expect(viewModel.saveBook.isEnabled)
        
        
        
    }
    
    @Test("Test that navigation title is 'Add Book' when creating")
    func testNavigationForNewBook() {
        let viewModel = AddEditViewModel()
        #expect(viewModel.navigationTitle == "Add Book")
    }
    
    @Test("Test that navigation title is 'Edit Book' when editing")
    func testNavigationForNewBook() {
        let viewModel = AddEditViewModel()
        #expect(viewModel.navigationTitle == "Edit Book")
    }
    
    @Test("Test isNotSavable works for a new book")
    func testNavigationForNewBook() {
        let viewModel = AddEditViewModel()
        #expect(viewModel.isNotSavable)
        #expect(viewModel.saveBook.isEnabled == false)
    }
    
    @Test("Test isNotSavable works for a existing book")
    func testNavigationForExistingBook() {
        let viewModel = AddEditViewModel()
        #expect(viewModel.isNotSavable)
        #expect(viewModel.saveBook.isEnabled == false)
        #expect(viewModel.navigationTitle == "Edit Book")
        
    }
    
    @Test("SaveBook adds a new book")
    func testSaveBookAddsNewBook() {
        let viewModel = AddEditViewModel()
        #expect(viewModel.saveBook().isEmpty)
        #expect(viewModel.navigationTitle == "Add Book")
        
    }
    
    @Test("SaveBook updates an existing book")
    func testSaveBookUpdatesExistingBook() {
        let viewModel = AddEditViewModel()
        
        #expect(viewModel.saveBook().isEmpty)
        #expect(viewModel.navigationTitle == "Edit Book")
        
    }
    
}
