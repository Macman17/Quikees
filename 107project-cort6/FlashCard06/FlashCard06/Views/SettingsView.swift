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
    
    var body: some View {
        Form{
            Section("Study"){
                Toggle("Shuffle cards", isOn: $shuffleCards)
                Toggle("Back first", isOn: $showBackFirst)
                Stepper("Card per session: \(cardPerSession)", value: $cardPerSession, in: 1...50)
            }
        }
    }
}
