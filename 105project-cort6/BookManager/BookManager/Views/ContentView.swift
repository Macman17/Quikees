//
//  ContentView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/12/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    
   
    @AppStorage(SETTINGS_THEME_KEY) private var currentTheme: Theme = .system
    @AppStorage(SETTINGS_ACCENT_COLOR_KEY) private var accentColor: Color = .blue
    @AppStorage(SETTINGS_SORT_KEY) private var sort: SortOption = .title
    @AppStorage(SETTINGS_FONT_SIZE_KEY) private var fontSize: Int = 14
    
    var colorScheme: ColorScheme? {
        switch currentTheme {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
   // Swift UI is declarative not imperative programming
       var body: some View {
           TabView{
               ListView()
                   .tabItem {
                  
                   Label("Books", systemImage: "books.vertical.fill")
               }
               FavoritesView()
                   .tabItem {
                       Label("Favorites", systemImage: "heart.fill")
                   }
               Settings()
                   .tabItem {
                       Label("Settings", systemImage: "gear")
                   }
           }
           .preferredColorScheme(colorScheme)
       }

   }


#Preview {
    ContentView()
        
}
