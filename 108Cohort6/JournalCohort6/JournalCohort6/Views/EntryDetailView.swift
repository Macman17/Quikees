//
//  EntryDetailView.swift
//  JournalCohort6
//
//  Created by Naqui Darby on 3/17/26.
//
import SwiftUI
import SwiftData

struct EntryDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let entry: JournalEntry
    @State private var showingEdit = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(entry.title)
                            .font(.title2)
                            .bold()

                        Text(entry.createdAt.formatted(date: .long, time: .shortened))
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    Button {
                        entry.isFavorite.toggle()
                    } label: {
                        Image(systemName: entry.isFavorite ? "star.fill" : "star")
                            .font(.title3)
                    }
                }

                Divider()

                Text(entry.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .navigationTitle("Entry")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") { showingEdit = true }
            }
            ToolbarItem(placement: .bottomBar) {
                Button(role: .destructive) {
                    context.delete(entry)
                    dismiss()
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }
        }
        .sheet(isPresented: $showingEdit) {
            NavigationStack {
                EntryFormView(entry: entry) // Edit
            }
        }
    }
}
