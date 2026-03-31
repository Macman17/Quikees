//
//  FlashcardModel.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/12/26.
//

import Foundation

struct Flashcard:Identifiable, Codable, Equatable{
    let id: UUID
    var front: String
    var back: String
    
    init(id:UUID = UUID(), front: String, back: String) {
        self.id = id
        self.front = front
        self.back = back
    }
}


