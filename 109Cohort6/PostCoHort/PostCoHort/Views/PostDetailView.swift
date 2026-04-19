//
//  PostDetailView.swift
//  PostCoHort
//
//  Created by Naqui Darby on 4/15/26.
//

import SwiftUI
import SwiftData

struct PostDetailView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    let post : Post

    
    var body: some View {
        ScrollView {
            VStack{
                
                    VStack(alignment: .leading){
                        Text(post.title)
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.gray)
                            .padding()
                       Spacer()
                        Text(post.body)
                            .font(.headline)
                            .border(Color.gray).padding(5)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                        
                        }
                    
                    .padding(5)
                    
                    
                        
                    }.navigationTitle("Posts Details")
                .navigationBarTitleDisplayMode(.inline)
                
            
                   
                }
        }
    
}

