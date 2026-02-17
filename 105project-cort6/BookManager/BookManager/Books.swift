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
}

