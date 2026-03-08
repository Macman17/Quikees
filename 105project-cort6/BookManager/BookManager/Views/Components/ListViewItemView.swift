//
//  ListViewItemView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/17/26.
//

import SwiftUI
import SwiftData

struct ListViewItemView: View {
    let book : PersistentBook
    
    var body: some View {
        
        
        HStack{
            Image( uiImage: (book.cover))
                .resizable()
                .scaledToFit()
                .frame(width: 60,height: 60 )
                .padding()
            VStack(alignment: .leading){
                    
                Text(book.title.capitalized(with: .current))
                        .font(.title.bold())
                    Text("by \(book.author)")
                        .font(.subheadline)
                    
                    
                
            }
        }
    }
}
      

