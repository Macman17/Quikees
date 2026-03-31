//
//  DeckStore.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/12/26.
//

import Foundation
import Combine
import SwiftUI




class DeckStore: ObservableObject {
    
    
    private let store:FileStore = FileStore(filename: "decks.json")
    
    @Published var decks: [Deck] = [] {
        
        didSet{
            save()
        }
    }
    
    init() {
        load()
        if decks.isEmpty{
            decks = Self.DefaultDecks
        }
    }
    
    private func load(){
        do{
            decks = try store.load([Deck].self)
        }catch{
            decks = []
        }
    }
    
    private func save(){
        do{
            try store.save(decks)
        }catch{
            print("Save error:", error.localizedDescription)
        }
    }
    
    
    func setDeck(for deckID: UUID) -> Deck? {
        decks.first(where: { $0.id == deckID })
    }
    
    
    func addNewDeck(name: String) {
        let newDeck = Deck(name: name, cards: [])
        decks.append(newDeck)
        save()
    }
    
    func deleteDeck(at offsets: IndexSet) {
        decks.remove(atOffsets: offsets)
    }
    
    func addCard(to deckID:UUID, front: String, back:String){
        guard let i = decks.firstIndex(where: { $0.id == deckID}) else {return}
        decks[i].cards.append(Flashcard(front: front, back: back))
    }
    
    func deleteCard(in deckID:UUID, at offsets: IndexSet){
        guard let i = decks.firstIndex(where: { $0.id == deckID}) else {return}
        decks[i].cards.remove(atOffsets: offsets)
    }
    
    
    static let DefaultDecks: [Deck] = [
        
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
