//
//  JournalEntry.swift
//  JournalCohort6
//
//  Created by Naqui Darby on 3/17/26.
//

import Foundation
import SwiftData



class JournalEntry {
    
    var title: String
    var body: String
    var createAt: Date
    var isFavorite: Bool
    
    init(title: String, body: String, createAt: Date = .now, isFavorite: Bool) {
        self.title = title
        self.body = body
        self.createAt = createAt
        self.isFavorite = isFavorite
    }
}
