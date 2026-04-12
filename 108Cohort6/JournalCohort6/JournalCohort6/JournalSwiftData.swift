//
//  JournalSwiftData.swift
//  JournalCohort6
//
//  Created by Naqui Darby on 4/9/26.
//
import SwiftUI
import SwiftData

@main
struct Class04App: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                EntryListView()
            }
        }
        .modelContainer(for: JournalEntry.self)
    }
}

