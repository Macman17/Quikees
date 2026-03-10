//
//  FavoritesView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/21/26.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Query var books: [PersistentBook]
    @State private var isFilterSheetPresented: Bool = false
    @State private var selectedGenre: Genre?
    @State private var readingStatus: ReadingStatus?
    @AppStorage(SETTINGS_GRID_COLUMNS_KEY) private var gridColumns: Int = 3
    
    //computed property
    private var favoriteBooks: [PersistentBook] {
        filterFavoriteBooks(books: books, genre: selectedGenre, readingStatus: readingStatus)
    }
    
    private var gridLayout: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: gridColumns)
    }
    
    var body: some View {
        NavigationStack{
            
            
            ScrollView{
               
                if selectedGenre != nil {
                    Text("Filtered by: \(selectedGenre!.rawValue.capitalized)")
                }
                if readingStatus != nil {
                    Text("Filtered by: \(readingStatus!.rawValue.capitalized)")
                }
                if favoriteBooks.isEmpty {
                    Text("No favorite books")
                }else{
                    LazyVGrid(columns: gridLayout){
                        ForEach(favoriteBooks){ book in
                            SquareCardView(book: book)
                        }
                    }.padding()
                }
            }.navigationTitle(Text("My favorites books"))
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button(action: { isFilterSheetPresented.toggle()
                        }){
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        }
                        .accessibilityLabel("Open filter options")
                    }
                }
                .sheet(isPresented: $isFilterSheetPresented){
                    FilterOptionsView(selectedGenre: $selectedGenre, readingStatus: $readingStatus)
                }
        }
    }

}
func filterFavoriteBooks(books: [PersistentBook], genre: Genre?, readingStatus: ReadingStatus?) -> [PersistentBook] {
    return books.filter{
        $0.isFavorite
        && (
            genre == nil
            || $0.genre == genre
        )
        && (
            readingStatus == nil
             || $0.readingStatus == readingStatus
        )
    }
}
