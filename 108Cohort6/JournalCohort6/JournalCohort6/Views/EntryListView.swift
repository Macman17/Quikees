//
//  EntryListView.swift
//  JournalCohort6
//
//  Created by Naqui Darby on 3/17/26.
//

import SwiftUI
import SwiftData

struct EntryListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalEntry.createdAt, order: .reverse) private var entries: [JournalEntry]
    @Query(sort: \JournalEntry.title, order: .forward ) private var entries2: [JournalEntry]

    @State private var searchText: String = ""
    @State private var showFavoritesOnly: Bool = false
    @State private var sortNewestFirst: Bool = true
    @State private var sortAlphabetically: Bool = false
    

    private var filteredEntries: [JournalEntry] {
        var result = showFavoritesOnly ? entries.filter { $0.isFavorite } : entries

        let s = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if !s.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(s) ||
                $0.body.localizedCaseInsensitiveContains(s)
            }
        }

        result.sort { a, b in
            sortNewestFirst ? (a.createdAt > b.createdAt) : (a.createdAt < b.createdAt)
            
        }
        result.sort { a, b in
            sortAlphabetically ? (a.title < b.title) : (a.title > b.title)
        }
        

        return result
    }

    var body: some View {
        List {
            if filteredEntries.isEmpty {
                ContentUnavailableView(
                    "No entries",
                    systemImage: "book.closed",
                    description: Text("Tap + to add your first journal entry.")
                )
            } else {
                ForEach(filteredEntries) { entry in
                    NavigationLink {
                        EntryDetailView(entry: entry)
                    } label: {
                        EntryRowView(entry: entry)
                    }
                }
                .onDelete(perform: deleteRows)
            }
        }
        .navigationTitle("Journal")
        .searchable(text: $searchText, prompt: "Search title or body")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }

            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    EntryFormView(entry: nil) // Create
                } label: {
                    Image(systemName: "plus")
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Toggle("Favorites only", isOn: $showFavoritesOnly)

                    Divider()

                    Picker("Sort", selection: $sortNewestFirst) {
                        Text("Newest first").tag(true)
                        Text("Oldest first").tag(false)
                        
                    }
                    Picker("Sort", selection: $sortAlphabetically){
                        Text("A-Z").tag(true)
                        Text("Z-A").tag(false)
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
            }
        }
    }

    private func deleteRows(at offsets: IndexSet) {
        for i in offsets {
            context.delete(filteredEntries[i])
        }
    }
}

private struct EntryRowView: View {
    let entry: JournalEntry

    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(entry.title)
                        .font(.headline)
                        .lineLimit(1)

                    if entry.isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                }

                Text(entry.createdAt.formatted(date: .abbreviated, time: .omitted))
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Spacer()

      
        }
        .padding(.vertical, 4)
    }
}
