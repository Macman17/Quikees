//
//  AddCardScreen.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/14/26.
//

import SwiftUI

struct AddCardScreen: View {
    @EnvironmentObject var store: DeckStore
    @Environment(\.dismiss) private var dismiss
    
    let deckID: UUID
    
    @State private var front: String = ""
    @State private var back: String = ""
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Front"){
                    TextField("Question/ Term", text: $front)
                }
                
                Section("Back"){
                    TextField("Answer/ Definition", text: $back)
                }
            }.navigationTitle("ADD CARD")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading
                    ){
                        Button("CANCEL"){
                            dismiss()
                        }
                        
                    }
                    ToolbarItem(placement: .topBarTrailing)
                    {
                        Button("Add"){
                            let f = front.trimmingCharacters(in: .whitespacesAndNewlines)
                            
                            let b = back.trimmingCharacters(in: .whitespacesAndNewlines)
                            
                            guard !f.isEmpty, !b.isEmpty else {return}
                            store.addCard(to: deckID, front: f, back: b)
                            dismiss()
                        }
                        .disabled(front.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                                  back.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    }
                }
        }
    }
}

#Preview {
    NavigationView {
        AddCardScreen( deckID: UUID()).environmentObject(DeckStore())
    }
}
