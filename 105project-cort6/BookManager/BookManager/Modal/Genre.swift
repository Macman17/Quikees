//
//  Genre.swift
//  BookManager
//
//  Created by Naqui Darby on 2/24/26.
//

enum Genre: String, CaseIterable, Codable, Hashable {
    case fantasy = "Fantasy"
    case romance = "Romance"
    case mystery = "Mystery"
    case sciFi = "Sci-Fi"
    case horror = "Horror"
    case thriller = "Thriller"
    
    case unknown = "Unknown"
}
