//
//  DetailView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/12/26.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    var book: PersistentBook
    @State private var showEditSheet: Bool = false
    @State private var isFavorite: Bool = false
    @Environment(\.modelContext) private var modelContext
    
    init(book: PersistentBook){
        self.book = book
        self.isFavorite = book.isFavorite
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(uiImage: book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160,height: 160 )
                
                VStack(alignment: .leading){
                    VStack{
                        Text(book.title)
                            .font(.largeTitle.bold())
                        
                        Text("by \(book.author)")
                            .font(.subheadline)
                        HStack{
                            CustomCapsule(text: book.genre.rawValue, color: .red)
                            Spacer()
                            CustomCapsule(text: book.readingStatus.rawValue, color: .green)
                            FavoriteToggle(isFavorite: $isFavorite)
                                .onChange(of:isFavorite) {
                                    book.isFavorite = isFavorite
                                    try? modelContext.save()
                                        
                                    
                                }
                        }
                        
                        
                    }
                }
            }
            
            HStack{
                Text(book.summary)
            }
            .font(.body)
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            
            
            if (book.rating > 0 || !book.review.isEmpty){
                VStack( alignment: .leading){
                    
                    HStack(){
                        Text("My Review")
                            .font(.headline.bold())
                        Spacer()
                        StarRatingView(rating: .init(book.rating))
                        
                    }
                    
                    
                    Text("\(book.review)")
                        .font(.subheadline)
                }
                .frame(width: .infinity, height: .infinity)
                .padding()
                Spacer()
                
            }
        }
        
        .padding(.horizontal)
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Edit", action:{
                   showEditSheet.toggle()
        }))
        .sheet(isPresented: $showEditSheet) {
            AddEditView(book: book, modelContext: modelContext)
            
        }
        .background(Color(.primary))
    }
        
}
    
