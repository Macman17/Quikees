//
//  FlashcardModel.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/12/26.
//

import Foundation

struct Flashcard:Identifiable{
    let id: UUID = UUID()
    var front: String
    var back: String
    
}

struct Deck: Identifiable{
    let id: UUID = UUID()
    var name: String
    var cards: [Flashcard]
}
