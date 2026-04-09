//
//  DeckListView.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/12/26.
//

import SwiftUI

struct DeckListView: View {
    @EnvironmentObject var store:DeckStore
    
    @AppStorage(SETTINGS_THEME_KEY) private var currentTheme: Theme = .system
    
    @AppStorage(SETTINGS_FONT_SIZE_KEY) private var fontSize: Int = 7
    
    @State private var showAddDeck: Bool = false
    
    var body: some View {
        List{
            Section("Decks"){
                ForEach(store.decks){ deck in
                    
                    NavigationLink{
                        StudyView(deck: deck)
                    } label: {
                        VStack(alignment: .leading){
                            Text(deck.name)
                                
                            Text("\(deck.cards.count)")
                        }
                    }
                    
                    
                }
            }
        }.toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        NavigationLink{
                            SettingsView()
                        } label:{
                            Image(systemName: "gear")
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
