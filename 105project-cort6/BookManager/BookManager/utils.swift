//
//  utils.swift
//  BookManager
//
//  Created by Naqui Darby on 3/10/26.
//

import SwiftUI



func filterFavoriteBook(
    books: [PersistentBook],
    genre: Genre? = nil,
    readingStatus: ReadingStatus? = nil
) -> [PersistentBook] {
    return books.filter{
        $0.isFavorite
        && (
            genre == nil
            || $0.genre == genre!
        )
        && (
            readingStatus == nil
            || $0.readingStatus == readingStatus!
        )
    }
}
    

