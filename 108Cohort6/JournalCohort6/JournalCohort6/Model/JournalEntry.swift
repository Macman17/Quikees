//
//  JournalEntry.swift
//  JournalCohort6
//
//  Created by Naqui Darby on 3/17/26.
//

import Foundation
import SwiftData


@Model
class JournalEntry {
    
    var title: String
    var body: String
    var createdAt: Date
    var isFavorite: Bool
    
    init(title: String, body: String, createdAt: Date = .now, isFavorite: Bool = false) {
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.isFavorite = isFavorite
    }
}
