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
    var coverData: Data?
    var summary: String
    var rating: Int = 0
    var review: String = ""
    var isFavorite: Bool = false
    var genre: Genre
    var readingStatus: ReadingStatus
    
   
    
    init(title: String,
         author: String = "",
         summary: String = "",
         rating: Int = 0,
         review: String = "",
         isFavorite: Bool = false,
         genre: Genre,
         readingStatus: ReadingStatus,
         coverData: Data? = nil) {
        self.title = title
        self.author = author
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
