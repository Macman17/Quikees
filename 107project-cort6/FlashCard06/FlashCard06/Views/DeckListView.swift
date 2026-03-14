//
//  DeckListView.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/12/26.
//

import SwiftUI

struct DeckListView: View {
    @EnvironmentObject var store:DeckStore
    var body: some View {
        List{
            Section("Decks"){
                ForEach(store.decks){ deck in
                    NavigationLink{
                        StudyView(deck: deck)
                    } label: {
                        VStack{
                            Text(deck.name)
                            Text("\(deck.cards.count) ")
                        }
                    }
                    
                }
            }.toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink{
                        SettingsView()
                    } label:{
                        Image(systemName: "gears")
                    }
                }
            }
        }
    }
}



#Preview {
    var store = DeckStore()
    
    NavigationStack{
        DeckListView().environmentObject(DeckStore())
    }
}
