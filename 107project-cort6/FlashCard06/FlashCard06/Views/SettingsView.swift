//
//  SettingsView.swift
//  FlashCard06
//
//  Created by Naqui Darby on 3/12/26.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("shuffleCards") private var shuffleCards: Bool = true
    @AppStorage("cardPerSession") private var cardPerSession: Int = 10
    @AppStorage("showBackFirst") private var showBackFirst: Bool = false
    @AppStorage(SETTINGS_THEME_KEY) private var currentTheme: Theme = .system
    
    @AppStorage(SETTINGS_FONT_SIZE_KEY) private var fontSize: Int = 7

    
    var body: some View {
        Form{
            Section("Study"){
                Toggle("Shuffle cards", isOn: $shuffleCards)
                Toggle("Back first", isOn: $showBackFirst)
                Stepper("Card per session: \(cardPerSession)", value: $cardPerSession, in: 1...50)
                Picker("Theme", selection: $currentTheme){
                    ForEach(Theme.allCases, id: \.self) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                Stepper("Font size: \(fontSize)", value: $fontSize, in: 1...20)
            }
            
        }
    }
}
