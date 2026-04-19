//
//  PostView.swift
//  PostCoHort
//
//  Created by Naqui Darby on 4/15/26.
//

import SwiftUI

struct PostView: View {
    
    @StateObject private  var viewModel = PostViewModel()
    
  
    
    var body: some View {
        NavigationStack {
            
                VStack{
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .padding()
                        
                        Button("Retry"){
                            Task{
                                await viewModel.loadPosts()
                            }
                        }
                    }
                    
                    List(viewModel.post){ item in
                        
                        NavigationLink (destination: PostDetailView(post: item)){
                    
                            
                            VStack(alignment: .leading){
                                Text(item.title)
                                    .font(.headline)
                            }
                            
                        }

                    }
                }.navigationTitle("Posts")
                    .task{
                        await viewModel.loadPosts()
                    }
            }
        
    }
}

