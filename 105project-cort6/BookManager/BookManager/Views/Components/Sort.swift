//
//  Sort.swift
//  BookManager
//
//  Created by Naqui Darby on 3/5/26.
//

import Foundation
import SwiftUI

// 1. Define your sorting Enum, conforming to String and CaseIterable
enum SortOption: String, CaseIterable {
    case title
    case date
    case size
}

struct Sort: View {
    // 2. Specify the Type (SortOption) and the default value (.title)
    @AppStorage("SETTINGS_SORT_KEY") private var sort: SortOption = .title

    var body: some View {
        Picker("Sort By", selection: $sort) {
            ForEach(SortOption.allCases, id: \.self) { option in
                Text(option.rawValue.capitalized).tag(option)
            }
        }
        .pickerStyle(.segmented)
        .padding()
        .onChange(of: sort) { oldValue, newValue in
            print("Sorted by: \(newValue.rawValue)")
        }
    }
}
