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
    @AppStorage("theme") private var theme: String = "light"
    @AppStorage("SETTINGS_FONT_SIZE_KEY") private var fontSize: Int = 7
  
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                DeckListView()
            }.environmentObject(store)
        }
    }
}
