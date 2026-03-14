//
//  FlashCard06App.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/12/26.
//

import SwiftUI

@main
struct FlashCard06App: App {
    @StateObject private var store = DeckStore()
    @AppStorage("darkMode") private var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                DeckListView()
            }.environmentObject(store)
        }
    }
}
