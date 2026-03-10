//
//  Settings.swift
//  BookManager
//
//  Created by Naqui Darby on 2/26/26.
//

import SwiftUI

struct Settings: View {
    
    @AppStorage(SETTINGS_THEME_KEY) private var currentTheme: Theme = .system
    @AppStorage(SETTINGS_GRID_COLUMNS_KEY) private var gridColumns: Int = 2
    @AppStorage(SETTINGS_ACCENT_COLOR_KEY) private var accentColor: Color = .blue
    @AppStorage(SETTINGS_FONT_SIZE_KEY) private var fontSize: Int = 7
    @AppStorage(SETTINGS_SORT_KEY) private var sort: SortOption  = .title
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    Picker("Theme", selection: $currentTheme){
                        ForEach(Theme.allCases, id: \.self) { theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    ColorPicker("Accent Color", selection: $accentColor)
                }
                Section(header: Text("Favorite View")){
                    Stepper("Columns: \(gridColumns)",value: $gridColumns, in: 1...4)
                    Stepper("Font Size: \(fontSize)", value: $fontSize)
                    Picker("Sort", selection: $sort){
                        ForEach(SortOption.allCases, id:\.self) {
                            sort in
                            Text(sort.rawValue).tag(sort)
                        }
                    }
                }
            }
        }
    }
}


