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
        
        let viewModel = AddEditViewModel(
            modelContext: modelContext)
        
        #expect(viewModel.title == "")
        #expect(viewModel.author == "")
        #expect(viewModel.genre == "")
        #expect(viewModel.summary == "")
        #expect(viewModel.isFavorite == false)
        #expect(viewModel.rating == 0)
        #expect(viewModel.readingStatus == "")
        #expect(viewModel.review == "")
        #expect(viewModel.coverData == nil)
        #expect(viewModel.saveBook.isEnabled)
        
        
    }
    
    @Test("Test init when editing an exisiting book")
    func testInitWithExistingBook() {
        
    }
    
    @Test("Test that navigation title is 'Add Book' when creating")
    func testNavigationForNewBook() {
        
    }
    
    @Test("Test that navigation title is 'Edit Book' when editing")
    func testNavigationForNewBook() {
        
    }
    
    @Test("Test isNotSavable works for a new book")
    func testNavigationForNewBook() {
        
    }
}
