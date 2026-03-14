//
//  DeckStore.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/12/26.
//

import Foundation
import Combine




class DeckStore: ObservableObject {
    @Published var decks: [Deck] = [
        
        Deck(name: "Swift Basics", cards:[
                Flashcard(front: "var vs left", back: "let is constant"),
                Flashcard(front: "optional", back: "a value that can be nil, but you have to unwrap"),
                                          
                                          ]),
        Deck(name: "Swift", cards:[
                Flashcard(front: "var vs left", back: "let is constant"),
                Flashcard(front: "optional", back: "a value that can be nil, but you have to unwrap"),
                                          
                                          ])
    ]
}
