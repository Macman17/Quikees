//
//  Deck.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/14/26.
//

import Foundation

struct Deck: Identifiable, Codable, Equatable{
    let id: UUID
    var name: String
    var cards: [Flashcard]
    
    init(id: UUID = UUID(), name: String, cards: [Flashcard]) {
        self.id = id
        self.name = name
        self.cards = cards
    }
}




