//
//  Books.swift
//  BookManager
//
//  Created by Naqui Darby on 2/12/26.
//

import Foundation


struct Book: Identifiable{
    let id: UUID = UUID()
    var title: String
    var author: String
    var cover: String
    var summary: String
    var rating: Int = 0
    var review: String = ""
    var isFavorite: Bool = false
    var genre: Genre = .unknown
    var readingStatus: ReadingStatus = .unknown
}

