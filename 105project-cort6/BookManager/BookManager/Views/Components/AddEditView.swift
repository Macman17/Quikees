//
//  AddEditView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/17/26.
//

import SwiftUI
import SwiftData


struct AddEditView: View {
    
    
        @StateObject private var viewModel: AddEditViewModel
        @Environment(\.dismiss) var dismiss
  
    
    
    
    init(book: PersistentBook? = nil, modelContext: ModelContext){
        _viewModel = StateObject(wrappedValue:  AddEditViewModel(book: book,  modelContext:  modelContext))
    }
        
        var body: some View {
            NavigationStack{
                
                Form{
                    Section(header: Text("Book details")){
                        TextField("Book Title", text: $viewModel.title)
                        TextField("Author", text: $viewModel.author)
                        TextField("Book Summary", text: $viewModel.summary)
                            .multilineTextAlignment(.leading)
                        Picker("Genre", selection: $viewModel.genre){
                            ForEach(Genre.allCases, id: \.self){ genre in
                                Text(genre.rawValue).tag(genre)
                            }
                        }
                        Section(header: Text("Book details")){
                            ImageField(data: $viewModel.coverData)
                            Picker("Reading Status", selection: $viewModel.readingStatus){
                                ForEach(ReadingStatus.allCases, id: \.self){
                                    readingstatus in
                                    Text(readingstatus.rawValue).tag(readingstatus)
                                }
                            }
                            
                            
                            Section(header: Text("Book Review")){
                                
                                StarRatingFieldView(rating: $viewModel.rating)
                                TextEditor(text: $viewModel.review)
                                    .frame(height: 150)
                                
                                
                                TextField("Review", text: $viewModel.review)
                                
                                    .multilineTextAlignment(.leading)
                                
                            }
                        }
                    }
                }
                        
                        .navigationTitle(viewModel.navigationTitle)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction){
                                Button("Cancel"){
                                    dismiss()
                                }
                            }
                            ToolbarItem(placement: .primaryAction){
                                FavoriteToggle(isFavorite: $viewModel.isFavorite)
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Save") {
                                
                                            dismiss()
                                }.disabled(viewModel.isNotSavable)
                            }
                            
                        }
                    }
                    
                }
            }
        
    

