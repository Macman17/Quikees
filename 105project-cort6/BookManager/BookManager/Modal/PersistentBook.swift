//
//  PersistentBook.swift
//  BookManager
//
//  Created by Naqui Darby on 3/3/26.
//

import Foundation
import SwiftData
import UIKit


@Model
class PersistentBook {
    var title: String
    var author: String
    var year: String
    var coverData: Data?
    var summary: String
    var rating: Int = 0
    var review: String = ""
    var isFavorite: Bool = false
    var genre: Genre
    var readingStatus: ReadingStatus
    
    init(_ book: PersistentBook){
        self.title = book.title
        self.author = book.author
        self.year = book.year
        self.summary = book.summary
        self.rating = book.rating
        self.review = book.review
        self.isFavorite = book.isFavorite
        self.genre = book.genre
        self.readingStatus = book.readingStatus
        self.coverData = book.coverData
        
    }
    
    init(title: String,
         author: String = "",
         year: String = "",
         summary: String = "",
         rating: Int = 0,
         review: String = "",
         isFavorite: Bool = false,
         genre: Genre = .unknown,
         readingStatus: ReadingStatus = .unknown,
         coverData: Data? = nil) {
        self.title = title
        self.author = author
        self.year = year
        self.summary = summary
        self.rating = rating
        self.review = review
        self.isFavorite = isFavorite
        self.genre = genre
        self.readingStatus = readingStatus
        self.coverData = coverData
    }
    
    
    
    var cover: UIImage{
        if self.coverData != nil{
            return UIImage(data: self.coverData!)!
        }else {
            return UIImage(resource: .lotrFellowship)
        }
    }
}
