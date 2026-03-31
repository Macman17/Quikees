//
//  AddDeckView.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/14/26.
//

import SwiftUI

struct AddDeckView: View {
    @EnvironmentObject var store: DeckStore
    @Environment(\.dismiss) private var dismiss
    
    @State var name: String = ""
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Add deck name", text: $name)
            }.navigationTitle("New Deck")
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
                            let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
                            guard !trimmed.isEmpty else {return}
                            store.addNewDeck(name: trimmed)
                            dismiss()
                        }
                        .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty )
                    }
                }
        }
    }
}

#Preview {
    AddDeckView().environmentObject(DeckStore())
}
