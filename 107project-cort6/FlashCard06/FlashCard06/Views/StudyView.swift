//
//  StudyView.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/12/26.
//

import SwiftUI
import SwiftData

struct StudyView: View {
    let deck: Deck
    
    @AppStorage("shuffleCards") private var shuffleCards: Bool = true
    @AppStorage("cardPerSession") private var cardPerSession: Int = 10
    @AppStorage("showBackFirst") private var showBackFirst: Bool = false
    @AppStorage("darkMode") private var isDarkMode: Bool = false
    
    
    @State private var index: Int = 0
    @State private var isFlipped: Bool = false
    @State private var sessionCards: [Flashcard] = []
    
    var body: some View {
        VStack(spacing:20){
            if sessionCards.isEmpty {
                Text("No cards to study")
            } else {
                Text("\(index + 1) / \(sessionCards.count)")
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.thinMaterial)
                        .frame(height: 100)
                    
                    Text("Spanish")
                }
                .onTapGesture {
                    isFlipped.toggle()
                }
                
                HStack(){
                    Button("Prev"){
                        
                    }
                    .buttonStyle(.bordered)
                    .disabled(index == 0)
                    
                    Button(isFlipped ? "Show front" : "Show back"){
                        isFlipped.toggle()
                        
                    }.buttonStyle(.bordered)
                        .disabled(index == sessionCards.count - 1 )
                    
                }
            }
            
        }
    }
            private var currentText: String {
                guard !sessionCards.isEmpty else { return "" }
                let card = sessionCards[index]
                
                let showFront = showBackFirst ? !isFlipped : isFlipped
                
            return showFront ? card.front : card.back
                
                
                
            }
            
            private func startSession(){
                var cards = deck.cards
                if shuffleCards {
                    cards.shuffle()
                }
                
                let limit = min(cardPerSession, cards.count)
                sessionCards = Array(cards.prefix(limit))
                index = 0
                isFlipped = false
            }
            
            private func next(){
                if index < sessionCards.count - 1 {
                    index += 1
                    isFlipped = false
                }
            }
            
            private func prev(){
                if index > 0 {
                    index -= 1
                    isFlipped = false
                }
            }
            
        }
        
    


#Preview {
    StudyView(deck: Deck(name: "My Deck", cards: [Flashcard(front: "Hello", back: "Hola"), Flashcard(front: "My name is", back: "Mi nombre es")]))
}
