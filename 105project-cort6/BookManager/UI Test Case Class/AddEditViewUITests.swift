//
//  AddEditViewUITests.swift
//  BookManager
//
//  Created by Naqui Darby on 3/31/26.
//


import XCTest

class AddEditViewUITests: XCTestCase {
    
    func testAddBookWorks() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Arrange: Get the initial state
        let beforeAddingBookCount = app.collectionViews.firstMatch.cells.count
        
        // Act: Simulate adding a new book
        let addBookButton = app.buttons["Add"]
        addBookButton.tap()
        
        let newBookTitle = "New book \(beforeAddingBookCount)"
        let titleTextField = app.textFields["Title of the book"]
        
        // Assert that the save button is disabled initially
        XCTAssertTrue(!app.buttons["Save"].isEnabled)
        
        // Act: Enter data and save
        titleTextField.tap()
        titleTextField.typeText(newBookTitle)
        app.buttons["Save"].tap()
        
        // Assert: Verify the UI has been updated correctly
        let afterAddingBookCount = app.collectionViews.firstMatch.cells.count
        XCTAssertEqual(afterAddingBookCount, (beforeAddingBookCount + 1))
        
        // Assert that the newly created book is visible
        let lastBookCell = app.collectionViews.firstMatch.cells.element(boundBy: beforeAddingBookCount)
        XCTAssertTrue(lastBookCell.staticTexts[newBookTitle].exists)
    }
}
