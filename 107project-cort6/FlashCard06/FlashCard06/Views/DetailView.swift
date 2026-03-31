//
//  DetailView.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/14/26.
//

import SwiftUI


struct DetailView: View {
    @EnvironmentObject var store: DeckStore
    let deckID: UUID
    var body: some View {
        let decks = store.setDeck(for: deckID)
        
        List{
            
            if let decks{
                Section("Cards"){
                    if decks.cards.isEmpty{
                        Text("No cards yet")
                        
                    }else{
                        ForEach(decks.cards){
                            cards in
                            VStack(alignment: .leading){
                                Text(cards.front)
                                Text(cards.back)
                            }
                        }
                        .onDelete{offset in
                            store.deleteCard(in: deckID, at: offset)}
                    }
                    
                }
            }
        }
    }
}

#Preview {
    DetailView(deckID: UUID()).environmentObject(DeckStore())
}
